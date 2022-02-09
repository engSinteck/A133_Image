#!/bin/sh
while [ 1 ]
do
	if [ -c "/dev/ttyUSB3" ]; then
		pppd call quectel-ppp &
		exit 0
	fi
	sleep 1
done
exit 0
