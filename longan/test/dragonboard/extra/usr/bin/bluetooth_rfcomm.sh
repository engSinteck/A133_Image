#!/bin/sh
#add serial port service
sdptool add SP
#add serial port
sleep 1
rfcomm watch hci0 &
#read: cat /dev/rfcomm0
#write: echo "test" > /dev/rfcomm0
