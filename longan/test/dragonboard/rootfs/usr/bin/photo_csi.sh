#!/bin/sh
fswebcam -r 640x480 -p YUV420P -> /data/cam640x480_1.jpg
ps | grep fim
if [ $? -eq "0" ]; then
	killall fim
fi
fim -a /data/cam640x480_1.jpg &
