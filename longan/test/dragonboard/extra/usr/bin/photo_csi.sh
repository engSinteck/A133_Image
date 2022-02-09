#!/bin/sh
csi_test_mplane
ps | grep fim
if [ $? -eq "0" ]; then
	killall fim
fi
fim -a `pwd`/yuv.jpg &
