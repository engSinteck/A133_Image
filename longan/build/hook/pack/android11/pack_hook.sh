#!/bin/bash

set -e

localpath=$(cd $(dirname $0) && pwd)
lichee_top_path=${LICHEE_TOP_DIR:-"$(cd $localpath/../../../.. && pwd)"}
prebuiltpath=$localpath/prebuilt
configlist="$lichee_top_path/.buildconfig $localpath/android.conf $prebuiltpath/build.prop"

function do_prepare()
{
	local toolspath=$(cd $localpath/.. && pwd)

	export PATH+=:$toolspath/tools/bin
	export LD_LIBRARY+=:$local_path/tools/lib64:$local_path/tools/lib
	source $toolspath/common.sh

	local fw=$localpath/$1
	[ ! -f $localpath/$1 ] && fw=$(find $localpath -maxdepth 1 -name "*.img")
	if [ -n "$fw" ]; then
		if [ "$(echo $fw | wc -w )" -gt 1 ]; then
			echo "multi firmware file find, please check!"
			return 1
		else
			unpack_img $fw $prebuiltpath/unpack
			rm -rf $fw
		fi
	fi

	rm -rf $prebuiltpath/*.img
	e2cp $prebuiltpath/unpack/system.img:/system/build.prop $prebuiltpath

	local list=$(load_config BOARD_ESSITIAL_IMAGE "$configlist")
	for f in $list; do
		cp $prebuiltpath/unpack/${f}.img $prebuiltpath
	done
	cp $(load_config LICHEE_PLAT_OUT "$configlist")/sunxi.dtb $prebuiltpath/dtb.img

	return 0
}

function make_boot()
{
	local MKBOOTIMG=mkbootimg
	local AVBTOOL=avbtool
	local KERNEL=$(load_config LICHEE_PLAT_OUT "$configlist")/bImage
	local RAMDISK=$prebuiltpath/ramdisk.img
	local BOOTIMG=$prebuiltpath/boot.img

	local KERNEL_OFFSET=0x8000
	local RAMDISK_OFFSET=0x02000000
	local OS_PATCH_LEVEL=$(load_config ro.build.version.security_patch "$configlist")
	local OS_VERSION=$(load_config ro.build.version.release "$configlist")
	local BUILD_TYPE=$(load_config ro.build.type "$configlist")

	local arch=$(load_config LICHEE_ARCH $configlist)
	local size=$(stat $KERNEL --format="%s")
	[ "x$arch" == "xarm64" ] && KERNEL_OFFSET=0x80000
	[ $size -gt $((16#1000000)) ] && RAMDISK_OFFSET=0x3000000

	local BOARD_BOOTIMAGE_PARTITION_SIZE=$(get_img_size $prebuiltpath/unpack/boot.img)
	local CMDLINE="androidboot.selinux=enforcing androidboot.dtbo_idx=0,1,2 firmware_class.path=/vendor/etc/firmware buildvariant=${BUILD_TYPE}"
	local INTERNAL_BOOTIMAGE_ARGS="--kernel ${KERNEL} --ramdisk ${RAMDISK} --base 0x40000000 --dtb $prebuiltpath/dtb.img"
	local INTERNAL_MKBOOTIMG_VERSION_ARGS="--os_version ${OS_VERSION} --os_patch_level ${OS_PATCH_LEVEL}"
	local BOARD_MKBOOTIMG_ARGS="--kernel_offset ${KERNEL_OFFSET} --ramdisk_offset ${RAMDISK_OFFSET} --dtb_offset 0x4000000 --header_version 0x3"
	local INTERNAL_AVB_BOOT_SIGNING_ARGS="--prop com.android.build.boot.os_version:${OS_VERSION}"
	local BOARD_AVB_BOOT_ADD_HASH_FOOTER_ARGS=""

	${MKBOOTIMG} ${INTERNAL_BOOTIMAGE_ARGS} \
		--cmdline "${CMDLINE}" \
		${INTERNAL_MKBOOTIMG_VERSION_ARGS} \
		${BOARD_MKBOOTIMG_ARGS} \
		--output ${BOOTIMG}

	${AVBTOOL} add_hash_footer \
		--image ${BOOTIMG} \
		--partition_size ${BOARD_BOOTIMAGE_PARTITION_SIZE} \
		--partition_name boot ${INTERNAL_AVB_BOOT_SIGNING_ARGS} \
		${BOARD_AVB_BOOT_ADD_HASH_FOOTER_ARGS}
}

function make_vendor_boot()
{
	local kmodpath=$(load_config LICHEE_PLAT_OUT "$configlist")/lib/modules/*/
	mkdir -p $prebuiltpath/vb $prebuiltpath/vb/ramdisk
	unpack_bootimg.py --boot_img $prebuiltpath/vendor_boot.img --out $prebuiltpath/vb
	mv $prebuiltpath/vb/vendor_ramdisk $prebuiltpath/vb/vendor_ramdisk.gz
	(cd $prebuiltpath/vb && gzip -d vendor_ramdisk.gz)
	(cd $prebuiltpath/vb/ramdisk && cpio --absolute-filenames -ivum < ../vendor_ramdisk)
	for f in $(find $prebuiltpath/vb/ramdisk/lib/modules -name "*.ko"); do
		if [ -f $kmodpath/$(basename $f) ]; then
			cp $kmodpath/$(basename $f) $prebuiltpath/vb/ramdisk/lib/modules
		fi
	done
	(cd $prebuiltpath/vb/ramdisk && find . | fakeroot cpio -o -Hnewc | gzip > ../vendor-ramdisk.cpio.gz)

	local MKBOOTIMG=mkbootimg
	local AVBTOOL=avbtool
	local KERNEL=$(load_config LICHEE_PLAT_OUT "$configlist")/bImage

	local KERNEL_OFFSET=0x8000
	local RAMDISK_OFFSET=0x02000000
	local OS_PATCH_LEVEL=$(load_config ro.build.version.security_patch "$configlist")
	local OS_VERSION=$(load_config ro.build.version.release "$configlist")
	local BUILD_TYPE=$(load_config ro.build.type "$configlist")

	local arch=$(load_config LICHEE_ARCH $configlist)
	local size=$(stat $KERNEL --format="%s")
	[ "x$arch" == "xarm64" ] && KERNEL_OFFSET=0x80000
	[ $size -gt $((16#1000000)) ] && RAMDISK_OFFSET=0x3000000

	local BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE=$(get_img_size $prebuiltpath/unpack/vendor_boot.img)
	local VENDOR_CMDLINE="androidboot.selinux=enforcing androidboot.dtbo_idx=0,1,2 firmware_class.path=/vendor/etc/firmware buildvariant=${BUILD_TYPE}"
	local INTERNAL_MKBOOTIMG_VERSION_ARGS="--os_version ${OS_VERSION} --os_patch_level ${OS_PATCH_LEVEL}"
	local BOARD_MKBOOTIMG_ARGS="--kernel_offset ${KERNEL_OFFSET} --ramdisk_offset ${RAMDISK_OFFSET} --dtb_offset 0x4000000 --header_version 0x3"
	local INTERNAL_AVB_VENDOR_BOOT_SIGNING_ARGS="--prop com.android.build.boot.os_version:${OS_VERSION}"
	local BOARD_AVB_VENDOR_BOOT_ADD_HASH_FOOTER_ARGS=""
	local INTERNAL_VENDOR_BOOTIMAGE_ARGS="--dtb $prebuiltpath/dtb.img --base 0x40000000"
	local INTERNAL_VENDOR_RAMDISK_TARGET=$prebuiltpath/vb/vendor-ramdisk.cpio.gz

	rm -rf $prebuiltpath/vendor_boot.img
	${MKBOOTIMG} \
		${INTERNAL_VENDOR_BOOTIMAGE_ARGS} \
		--vendor_cmdline "${VENDOR_CMDLINE}" \
		${INTERNAL_MKBOOTIMG_VERSION_ARGS} \
		${BOARD_MKBOOTIMG_ARGS} \
		--vendor_ramdisk ${INTERNAL_VENDOR_RAMDISK_TARGET} \
		--vendor_boot $prebuiltpath/vendor_boot.img

	${AVBTOOL} add_hash_footer \
		--image $prebuiltpath/vendor_boot.img \
		--partition_size ${BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE} \
		--partition_name vendor_boot ${INTERNAL_AVB_VENDOR_BOOT_SIGNING_ARGS} \
		${BOARD_AVB_VENDOR_BOOT_ADD_HASH_FOOTER_ARGS}
	rm -rf $prebuiltpath/vb
}

function do_pack()
{
	local platform_version=$(load_config ro.build.version.release "$configlist")
	local packpath=$lichee_top_path/build
	local addition=$(load_config BOARD_ADD_PACK_CONFIG "$configlist")
	for f in $addition; do
		if [ -f $prebuiltpath/unpack/$f ]; then
			addtion_files+=" $prebuiltpath/unpack/$f:$lichee_top_path/out/pack_out/$(basename $f)"
		elif [ -f $localpath/$f ]; then
			addtion_files+=" $localpath/$f:$lichee_top_path/out/pack_out/$(basename $f)"
		else
			return 1
		fi
	done

	(
	cd $packpath
	ANDROID_IMAGE_OUT=$prebuiltpath \
	./pack -a "$addtion_files" --platform_version ${platform_version} $@
	)

	return $?
}

function pack_hook()
{
	local functab=(
			do_prepare
			modify_system
			modify_vendor
			modify_product
			make_super
			make_boot
			make_vendor_boot
			make_dtbo
			make_vbmeta
			make_vbmeta_system
			make_vbmeta_vendor
			make_vbmeta
			do_pack)

	for func in ${functab[@]}; do
		$func $@
		if [ $? -eq 0 ]; then
			printf "\033[48;34m$(date "+%Y-%m-%d %H:%M:%S") - ${func}: run success\033[0m\n"
		else
			printf "\033[48;31m$(date "+%Y-%m-%d %H:%M:%S") - ${func}: run failed\033[0m\n"
			exit 1
		fi
	done

	return 0
}

pack_hook $@
