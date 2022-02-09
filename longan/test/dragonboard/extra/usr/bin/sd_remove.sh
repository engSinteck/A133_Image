#!/bin/sh
mount | grep $1
if [ $? -eq 0 ]; then
	fuser -m -k /media/sdcard/$1
	usleep 100
fi
umount /media/sdcard/$1
rm /media/sdcard/$1 -rf
