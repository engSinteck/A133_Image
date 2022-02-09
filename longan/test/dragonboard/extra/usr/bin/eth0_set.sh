#!/bin/sh
stty erase ^h
read -p "Enter your static ip: " eth0_ip
read -p "Enter your static route: " eth0_route
nmcli con add con-name "static-eth0" ifname eth0 type ethernet ip4 \
$eth0_ip gw4 $eth0_route
nmcli con up "static-eth0" ifname eth0
