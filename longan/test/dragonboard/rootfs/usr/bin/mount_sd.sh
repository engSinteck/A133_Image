#!/bin/sh
if [ -d /sys/fs/cgroup/systemd ]; then
	echo "$$" > /sys/fs/cgroup/systemd/tasks
fi
mkdir -p /media/sdcard/$1
mount -t ntfs-3g -o iocharset=utf8 /dev/$1 /media/sdcard/$1
