#!/bin/sh
rfkill unblock all
#find hci0
killall hciattach
hciattach -n -s 1500000 /dev/ttyBT0 sprd &
#bluetooth up
hciconfig hci0 up && hciconfig hci0 piscan
bluetoothctl
