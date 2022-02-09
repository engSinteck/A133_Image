#!/bin/sh

mkfs.ext4 /dev/mmcblk0p6
chmod +s /usr/bin/sudo
chmod a+s /bin/su
chown -R szbaijie:szbaijie /home/szbaijie/

rm -rf /etc/systemd/system/multi-user.target.wants/firstboot.service 
exit 0

