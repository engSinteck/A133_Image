#!/bin/sh
arecord -d 3 -r 16000 -c 1 -t wav  /data/luyin.wav
aplay /data/luyin.wav
