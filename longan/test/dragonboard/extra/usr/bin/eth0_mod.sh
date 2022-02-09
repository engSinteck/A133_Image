#!/bin/sh
stty erase ^h
read -p "Enter your static ip: " eth0_ip
nmcli con mod "static-eth0" ipv4.address "$eth0_ip,8.8.8.8"
nmcli con up "static-eth0" ifname eth0
