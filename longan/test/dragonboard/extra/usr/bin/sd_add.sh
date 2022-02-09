#!/bin/sh
blkid /dev/$1 | grep ext4
if [ $? -eq 0 ]; then
	mkdir -p /media/sdcard/$1
	mount -t ext4 /dev/$1 /media/sdcard/$1
fi

blkid /dev/$1 | grep ntfs
if [ $? -eq 0 ]; then
	/usr/bin/mount_sd.sh $1
fi

blkid /dev/$1 | grep vfat
if [ $? -eq 0 ]; then
	mkdir -p /media/sdcard/$1
	mount -t vfat -o iocharset=utf8 /dev/$1 /media/sdcard/$1
fi
