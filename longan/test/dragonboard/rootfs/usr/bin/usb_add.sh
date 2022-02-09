#!/bin/bash
blkid /dev/$1 | grep ext4
if [ $? -eq 0 ]; then
	mkdir -p /media/udisk/$1
	mount -t ext4 /dev/$1 /media/udisk/$1
	UPDATE=/media/udisk/$1/boot/update.sh
	if [ -f $UPDATE ]; then
		/$UPDATE
	fi
fi

blkid /dev/$1 | grep ntfs
if [ $? -eq 0 ]; then
	/usr/bin/mount_usb.sh $1
	UPDATE=/media/udisk/$1/boot/update.sh
	if [ -f $UPDATE ]; then
		/$UPDATE
	fi
:<<!
	apt-get install at
	systemctl enable atd.service
	echo /usr/bin/mount_usb.sh $1 | at now
!
fi

blkid /dev/$1 | grep vfat
if [ $? -eq 0 ]; then
	mkdir -p /media/udisk/$1
	mount -t vfat -o iocharset=utf8 /dev/$1 /media/udisk/$1
	UPDATE=/media/udisk/$1/boot/update.sh
	if [ -f $UPDATE ]; then
		/$UPDATE
	fi
fi
