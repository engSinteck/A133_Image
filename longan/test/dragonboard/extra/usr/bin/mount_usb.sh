#!/bin/sh
if [ -d /sys/fs/cgroup/systemd ]; then
	echo "$$" > /sys/fs/cgroup/systemd/tasks
fi
mkdir -p /media/udisk/$1
mount -t ntfs-3g -o iocharset=utf8 /dev/$1 /media/udisk/$1
