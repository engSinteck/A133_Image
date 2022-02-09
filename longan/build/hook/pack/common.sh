#!/bin/bash

function get_raw_data()
{
	local src=$1
	local dst=$2
	local offset=$3
	local size=$4
	local bs=4096

	local skip_num skip_rem size_num size_rem size_cur

	skip_num=$((offset/bs))
	skip_rem=$((offset%bs))

	if [ $skip_rem -ne 0 ]; then
		size_num=$(((size-bs+skip_rem)/bs))
		size_rem=$(((size-bs+skip_rem)%bs))
		dd if=$src of=$dst bs=1 skip=$offset count=$((bs-skip_rem)) status=none
		dd if=$src of=$dst bs=$bs skip=$((skip_num+1)) count=$size_num oflag=append conv=notrunc status=none
		if [ $size_rem -ne 0 ]; then
			dd if=$src of=$dst bs=1 skip=$(((skip_num+1+size_num)*bs)) count=$size_rem oflag=append conv=notrunc status=none
		fi
	else
		size_num=$((size/bs))
		size_rem=$((size%bs))
		dd if=$src of=$dst bs=$bs skip=$skip_num count=$size_num status=none
		if [ $size_rem -ne 0 ]; then
			dd if=$src of=$dst bs=1 skip=$(((skip_num+size_num)*bs)) count=$size_rem oflag=append conv=notrunc status=none
		fi
	fi
}

function extract_data()
{
	local fw=$1
	local out=$2
	local magic="0001000000040000"
	local offset main sub name size ofs

	for ((i=0;i<256;i++)); do
		offset=$((i*1024))
		if [ "x$(hexdump -s $offset -n 8 -v -e '8/1 "%02X"' $fw)" == "x$magic" ]; then
			main=$(hexdump -s $((offset+8)) -n 8 -v -e '"%c"' $fw)
			sub=$(hexdump -s $((offset+16)) -n 16 -v -e '"%c"' $fw)
			name=$(hexdump -s $((offset+36)) -n 32 -v -e '"%c"' $fw | tr -d '\000')
			size=$(hexdump -s $((offset+300)) -n 4 -v -e '4/1 "%02X"' $fw)
			size=$(printf "%d" 0x${size:6:2}${size:4:2}${size:2:2}${size:0:2})
			ofs=$(hexdump -s $((offset+308)) -n 4 -v -e '4/1 "%02X"' $fw)
			ofs=$(printf "%d" 0x${ofs:6:2}${ofs:4:2}${ofs:2:2}${ofs:0:2})

			printf "[%-8s, %-16s]: %-18s, offset: %08X, size: %08X\n" "$main" "$sub" "$name" $ofs $size
			case "$main" in
				RFSFAT16)
					if [ $size -gt 4 ]; then
						get_raw_data "$fw" "$out/${name/%.fex/.img}" $ofs $size
					fi
					;;
				*)
					if [ "$name" == "sys_partition.fex" ]; then
						get_raw_data "$fw" "$out/$name" $ofs $size
					fi
					;;
			esac
		fi
	done
}

function unpack_img()
{
	local fw=$1
	local out=$2
	local tmp=$out/tmp

	mkdir -p $out $tmp
	find $out $tmp -type f | xargs rm -rf

	extract_data $fw $out
	unpack_super $out/super.img $out
	unpack_boot  $out/boot.img  $out
	unpack_env   $out/env.img   $out
}

function unpack_super()
{
	local img=$1
	local out=$2
	local tmp=$out/tmp

	([ -f $img ] && simg2img $img $tmp/super.ext4 && lpunpack $tmp/super.ext4 $out)
	local list=$(load_config BOARD_SB_PARTITION_LIST "$configlist")
	for f in $list; do
		[ -f $out/${f}_a.img ] && mv $out/${f}_a.img $out/${f}.img
		rm -rf $out/${f}_b.img
	done
}

function unpack_boot()
{
	local img=$1
	local out=$2
	unpack_bootimg.py --boot_img $img --out $out
	mv $out/ramdisk $out/ramdisk.img
}

function unpack_env()
{
	local img=$1
	local out=$2
	local size=$(get_img_size $img)

	get_raw_data $img $out/env.cfg 4 $((size-4))
	sed -i 's|\x00|\x0a|g' $out/env.cfg
	sed -i '/^$/d' $out/env.cfg
}

function load_config()
{
	local cfgkey=$1
	local cfgfile=""
	local defval=$3
	local val=""

	for f in $2; do
		[ -f $f ] && cfgfile+=" $f"
	done

	[ -n "$cfgfile" ] && val="$(awk -F= '/^(export)*[[:space:]]*'"$cfgkey"'=/{print $2}' $cfgfile | tail -n 1)"
	eval echo "${val:-"$defval"}"
}

function get_img_size()
{
	local image_i=$(readlink -f $1)
	local image_t=$(dirname $image_i)/.get-img-size.ext4
	local magic=$(hexdump -n 8 -v -e '8/1 "%02X"' $image_i)

	case "$magic" in
		"3AFF26ED01000000")
			simg2img $image_i $image_t
			stat $image_t --format="%s"
			;;
		*)
			stat $image_i --format="%s"
			;;
	esac

	rm -rf $image_t
}

function make_dtbo()
{
	local BOARD_PREBUILT_DTBOIMAGE=$(load_config LICHEE_PLAT_OUT $configlist)/dtbo.img
	[ ! -f $BOARD_PREBUILT_DTBOIMAGE ] && return 0

	local AVBTOOL=avbtool
	local INSTALLED_DTBOIMAGE_TARGET=$prebuiltpath/dtbo.img
	local BOARD_DTBOIMG_PARTITION_SIZE=$(get_img_size $prebuiltpath/unpack/dtbo.img)
	local INTERNAL_AVB_DTBO_SIGNING_ARGS=""
	local BOARD_AVB_DTBO_ADD_HASH_FOOTER_ARGS=""

	cp ${BOARD_PREBUILT_DTBOIMAGE} ${INSTALLED_DTBOIMAGE_TARGET}

	${AVBTOOL} add_hash_footer \
		--image ${INSTALLED_DTBOIMAGE_TARGET} \
		--partition_size ${BOARD_DTBOIMG_PARTITION_SIZE} \
		--partition_name dtbo ${INTERNAL_AVB_DTBO_SIGNING_ARGS} \
		${BOARD_AVB_DTBO_ADD_HASH_FOOTER_ARGS}
}

function make_vbmeta_system()
{
	local prebuilt_path=$prebuiltpath

	local AVBTOOL=avbtool

	local BOARD_AVB_VBMETA_SYSTEM_ALGORITHM=$(load_config BOARD_AVB_VBMETA_SYSTEM_ALGORITHM "$configlist")
	local BOARD_AVB_VBMETA_SYSTEM_KEY_PATH=$lichee_top_path/$(load_config BOARD_AVB_VBMETA_SYSTEM_KEY_PATH "$configlist")

	local PLATFORM_SECURITY_PATCH=$(load_config ro.build.version.security_patch "$configlist")
	local BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX=$(date -d 'TZ="GMT" '"${PLATFORM_SECURITY_PATCH}" +%s)

	local INTERNAL_AVB_VBMETA_SYSTEM_SIGNING_ARGS="--algorithm ${BOARD_AVB_VBMETA_SYSTEM_ALGORITHM} --key ${BOARD_AVB_VBMETA_SYSTEM_KEY_PATH}"
	local INTERNAL_AVB_MAKE_VBMETA_SYSTEM_IMAGE_ARGS="--include_descriptors_from_image $prebuilt_path/system.img"
	local BOARD_AVB_MAKE_VBMETA_SYSTEM_IMAGE_ARGS="--padding_size 4096"
	BOARD_AVB_MAKE_VBMETA_SYSTEM_IMAGE_ARGS+=" --rollback_index ${BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX}"

	rm -rf $prebuilt_path/vbmeta_system.img
	${AVBTOOL} make_vbmeta_image \
		${INTERNAL_AVB_VBMETA_SYSTEM_SIGNING_ARGS} \
		${BOARD_AVB_MAKE_VBMETA_SYSTEM_IMAGE_ARGS} \
		${INTERNAL_AVB_MAKE_VBMETA_SYSTEM_IMAGE_ARGS} \
		--output $prebuilt_path/vbmeta_system.img
}

function make_vbmeta_vendor()
{
	local prebuilt_path=$prebuiltpath

	local AVBTOOL=avbtool

	local BOARD_AVB_VBMETA_VENDOR_ALGORITHM=$(load_config BOARD_AVB_VBMETA_SYSTEM_ALGORITHM "$configlist")
	local BOARD_AVB_VBMETA_VENDOR_KEY_PATH=$lichee_top_path/$(load_config BOARD_AVB_VBMETA_SYSTEM_KEY_PATH "$configlist")

	local PLATFORM_SECURITY_PATCH=$(load_config ro.build.version.security_patch "$configlist")
	local BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX=$(date -d 'TZ="GMT" '"${PLATFORM_SECURITY_PATCH}" +%s)

	local INTERNAL_AVB_VBMETA_VENDOR_SIGNING_ARGS="--algorithm ${BOARD_AVB_VBMETA_VENDOR_ALGORITHM} --key ${BOARD_AVB_VBMETA_VENDOR_KEY_PATH}"
	local INTERNAL_AVB_MAKE_VBMETA_VENDOR_IMAGE_ARGS="--include_descriptors_from_image $prebuilt_path/vendor.img"
	local BOARD_AVB_MAKE_VBMETA_VENDOR_IMAGE_ARGS="--padding_size 4096"
	BOARD_AVB_MAKE_VBMETA_VENDOR_IMAGE_ARGS+=" --rollback_index ${BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX}"

	rm -rf $prebuilt_path/vbmeta_vendor.img
	${AVBTOOL} make_vbmeta_image \
		${INTERNAL_AVB_VBMETA_VENDOR_SIGNING_ARGS} \
		${BOARD_AVB_MAKE_VBMETA_VENDOR_IMAGE_ARGS} \
		${INTERNAL_AVB_MAKE_VBMETA_VENDOR_IMAGE_ARGS} \
		--output $prebuilt_path/vbmeta_vendor.img
}

function make_vbmeta()
{
	local prebuilt_path=$prebuiltpath
	local local_avb_key=$prebuilt_path/avb_chain_keys

	local AVBTOOL=avbtool

	local BOARD_AVB_VBMETA_SYSTEM_KEY_PATH=$lichee_top_path/$(load_config BOARD_AVB_VBMETA_SYSTEM_KEY_PATH "$configlist")
	local BOARD_AVB_VBMETA_VENDOR_KEY_PATH=$lichee_top_path/$(load_config BOARD_AVB_VBMETA_VENDOR_KEY_PATH "$configlist")
	local BOARD_AVB_KEY_PATH=$lichee_top_path/$(load_config BOARD_AVB_KEY_PATH "$configlist")

	local BOARD_AVB_ALGORITHM=$(load_config BOARD_AVB_ALGORITHM "$configlist")
	local list=$(load_config BOARD_AVB_INCLUDE_PARTITON "$configlist")

	# extract-avb-chain-public-keys
	mkdir -p $local_avb_key
	if [ -n "$BOARD_AVB_VBMETA_SYSTEM_KEY_PATH" ]; then
		${AVBTOOL} extract_public_key --key ${BOARD_AVB_VBMETA_SYSTEM_KEY_PATH} \
			--output $local_avb_key/vbmeta_system.avbpubkey
	fi

	if [ -n "$BOARD_AVB_VBMETA_VENDOR_KEY_PATH" ]; then
		${AVBTOOL} extract_public_key --key ${BOARD_AVB_VBMETA_VENDOR_KEY_PATH} \
			--output $local_avb_key/vbmeta_vendor.avbpubkey
	fi

	# build-vbmetaimage-target
	local PRIVATE_AVB_VBMETA_SIGNING_ARGS="--algorithm ${BOARD_AVB_ALGORITHM} --key ${BOARD_AVB_KEY_PATH}"
	local BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS="--padding_size 4096"
	local INTERNAL_AVB_MAKE_VBMETA_IMAGE_ARGS=""

	for p in $list; do
		INTERNAL_AVB_MAKE_VBMETA_IMAGE_ARGS+=" --include_descriptors_from_image $prebuilt_path/${p}.img"
	done
	INTERNAL_AVB_MAKE_VBMETA_IMAGE_ARGS+=" --chain_partition vbmeta_system:1:$local_avb_key/vbmeta_system.avbpubkey"
	INTERNAL_AVB_MAKE_VBMETA_IMAGE_ARGS+=" --chain_partition vbmeta_vendor:2:$local_avb_key/vbmeta_vendor.avbpubkey"

	rm -rf $prebuilt_path/vbmeta.img

	${AVBTOOL} make_vbmeta_image \
		${INTERNAL_AVB_MAKE_VBMETA_IMAGE_ARGS} \
		${PRIVATE_AVB_VBMETA_SIGNING_ARGS} \
		${BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS} \
		--output $prebuilt_path/vbmeta.img

	rm -rf $local_avb_key
}

function make_super()
{
	local prebuilt_path=$prebuiltpath

	local BOARD_SUPER_RESERVED_SIZE=$(load_config BOARD_SUPER_RESERVED_SIZE "$configlist")
	local BOARD_SB_PARTITION_LIST=$(load_config BOARD_SB_PARTITION_LIST "$configlist")
	local ab_update=$(load_config PRODUCT_VIRTUAL_AB_OTA "$configlist")

	local BOARD_SUPER_PARTITION_SIZE=$(get_img_size $prebuilt_path/unpack/super.img)
	local BOARD_SB_SIZE=$((BOARD_SUPER_PARTITION_SIZE-BOARD_SUPER_RESERVED_SIZE))

	local partion_size=""

	local lpmake_args="--metadata-size 65536 --super-name super"

	if [ "$ab_update" == "true" ]; then
		lpmake_args+=" --metadata-slots 3 --virtual-ab"
		lpmake_args+=" --device super:${BOARD_SUPER_PARTITION_SIZE}"
		lpmake_args+=" --group sb_a:${BOARD_SB_SIZE}"
		lpmake_args+=" --group sb_b:${BOARD_SB_SIZE}"
		for p in $BOARD_SB_PARTITION_LIST; do
			partion_size=$(get_img_size $prebuilt_path/unpack/${p}.img)
			lpmake_args+=" --partition ${p}_a:readonly:${partion_size}:sb_a --image ${p}_a=$prebuilt_path/${p}.img"
			lpmake_args+=" --partition ${p}_b:readonly:0:sb_b"
		done
	else
		lpmake_args+=" --metadata-slots 2"
		lpmake_args+=" --device super:${BOARD_SUPER_PARTITION_SIZE}"
		lpmake_args+=" --group sb:${BOARD_SB_SIZE}"
		for p in $BOARD_SB_PARTITION_LIST; do
			partion_size=$(get_img_size $prebuilt_path/unpack/${p}.img)
			lpmake_args+=" --partition ${p}:readonly:${partion_size}:sb --image ${p}=$prebuilt_path/${p}.img"
		done
	fi

	lpmake_args+=" --sparse --output $prebuilt_path/super.img"
	printf "\033[48;34m$(date "+%Y-%m-%d %H:%M:%S") - ${func}: lpmake ${lpmake_args}\033[0m\n"

	rm -rf $prebuilt_path/super*.img
	lpmake ${lpmake_args}
}

function modify_system()
{
	printf "\033[48;33m$(date "+%Y-%m-%d %H:%M:%S") - ${FUNCNAME[0]}: not implement currently\033[0m\n"
	return 0
}

function modify_vendor()
{
	local kmodpath=$(load_config LICHEE_PLAT_OUT "$configlist")/lib/modules/*/
	local imodpath=$(load_config BOARD_MODULE_PATH "$configlist")
	local image=$prebuiltpath/vendor.img
	local list=$(e2ls ${image}:/$imodpath)
	for f in $list; do
		if [ -f $kmodpath/$f ]; then
			e2cp -P 644 -O 0 -G 0 $kmodpath/$f ${image}:/$imodpath/
		fi
	done
}

function modify_product()
{
	printf "\033[48;33m$(date "+%Y-%m-%d %H:%M:%S") - ${FUNCNAME[0]}: not implement currently\033[0m\n"
	return 0
}
