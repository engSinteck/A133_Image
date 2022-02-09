#######################################################
# Filename     : fast_switch.sh
# Last modified: 2021-04-12 17:09
# Author       : jzzh
# Email        : jzzh@szbaijie.cn
# Company site : http://www.szbaijie.cn/index.php
# Description  : 
#######################################################
#!/bin/sh

function gettop
{
    local TOPFILE=build/szbaijie_env.sh
    if [ -n "$TARGET_TOP" -a -f "$TARGET_TOP/$TOPFILE" ] ; then
        # The following circumlocution ensures we remove symlinks from TOP.
        cd $TARGET_TOP; PWD= /bin/pwd
	 else
		if [ -f $TOPFILE ] ; then
            # The following circumlocution (repeated below as well) ensures
            # that we record the true directory name and not one that is
            # faked up with symlink names.
            PWD= /bin/pwd;
        else
            local here="${PWD}"
            while [ "${here}" != "/" ]; do
                if [ -f "${here}/${TOPFILE}" ]; then
                    (\cd ${here}; PWD= /bin/pwd)
                    break
                fi
                here="$(dirname ${here})"
            done
		fi
    fi
}

# == jump directory ==
function croot()
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return
    
	\cd $T
}

function cboot()
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_UBOOT
}

function cdts()
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_DTS
}

function ckernel
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_KERNEL_VERSION
}

function cdrivers
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_DRIVER
}

function cconfigs
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $TARGET_CONFIG/../
}

function cconfig
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $TARGET_CONFIG
}

function cextra
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_EXTRA
}

function crootfs
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_ROOTFS
}
function cdevice
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_DEVICE
}

function cout
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_OUT
}

function candroid
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/../android
}

# == build project ==
function mlongan
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

	if [ ! "$1" = "distclean" ] && [ ! "$1" = "clean" ]; then
		if [ "`cat $T/.buildconfig | grep -w LICHEE_PLATFORM | awk -F '=' '{ print $2}'`" = "android" ]; then
			\cd $T && ./build.sh
		else
			\cd $T && ./build.sh && ./build.sh pack 
		fi
	else
		echo "=== longan .config $1 ==="
		\cd $T && ./build.sh $1 
	fi

	cd -
}

function mkernel
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return
	
	if [ ! "$1" = "distclean" ] && [ ! "$1" = "clean" ]; then
		\cd $T && ./build.sh kernel 
	else
		\cd $T && ./build.sh $1 
	fi


	cd -
}

function menuconfig
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

    \cd $T/$TARGET_KERNEL_VERSION && make menuconfig ARCH=arm64 

	cd -
}

function mboot
{
    local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

	if [ -f $T/$TARGET_UBOOT/.config ]; then
		if [ ! "$1" = "distclean" ] && [ ! "$1" = "clean" ]; then
			\cd $T/$TARGET_UBOOT && make -j
		else
			\cd $T/$TARGET_UBOOT && make $1
		fi
	else
		if [ "$1" = "distclean" ] || [ "$1" = "clean" ]; then
			\cd $T/$TARGET_UBOOT && make $1 
		else
			\cd $T/$TARGET_UBOOT && make sun50iw10p1_defconfig && make -j
		fi
	fi

	cd -
}

function mconfig
{
	local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

	echo "=== reconfig .buildconfig ==="
	if [ -f "$T/.buildconfig" ]; then
		rm $T/.buildconfig && \cd $T/  && ./build.sh config
	else
		\cd $T/  && ./build.sh config
	fi
}

function main()
{
	local T=$(gettop)
    [ -z "$T" ] \
        && echo "Couldn't locate the top of the tree.  Try setting TOP." \
        && return

	if [ -f "$T/.buildconfig" ] && [ -n "`cat $T/.buildconfig | grep LICHEE_LINUX_DEV | awk -F '=' '{ print $2}'`" ] \
		&& [ "`cat $T/.buildconfig | grep -w LICHEE_PLATFORM | awk -F '=' '{ print $2}'`" = "linux" ] \
		|| [ "`cat $T/.buildconfig | grep -w LICHEE_PLATFORM | awk -F '=' '{ print $2}'`" = "android" ]; then
		export TARGET_TOP="$(PWD= /bin/pwd)"
		TARGET_KERNEL_VERSION="kernel/linux-4.9"
		TARGET_DEVICE="test/dragonboard/" 
		TARGET_OUT="out"
		TARGET_UBOOT="brandy/brandy-2.0/u-boot-2018"
		TARGET_DRIVER="$TARGET_KERNEL_VERSION/drivers/"
		TARGET_DTS="$TARGET_KERNEL_VERSION/arch/arm64/boot/dts/sunxi/"
		TARGET_EXTRA="$TARGET_DEVICE/extra"
		TARGET_ROOTFS="$TARGET_DEVICE/rootfs"
		TARGET_CONFIG=`cat $T/.buildconfig | grep LICHEE_BOARD_CONFIG_DIR | awk -F '=' '{ print $2}'`
	else
		echo "=== not find or error of the .buildconfig ==="
		\cd $T/ && ./build.sh config
	fi
}

main
