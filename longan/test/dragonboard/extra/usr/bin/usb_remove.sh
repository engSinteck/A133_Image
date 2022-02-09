#!/bin/sh
mount | grep $1
if [ $? -eq 0 ]; then
	fuser -m -k /media/udisk/$1
	usleep 100
fi
umount /media/udisk/$1
rm /media/udisk/$1 -rf
