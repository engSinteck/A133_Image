#!/bin/sh
stty erase ^h
read -p "Enter your WIFI SSID: " wifi_ssid
read -p "Enter your WIFI Password: " wifi_password
nmcli connection modify wifi wifi.ssid "$wifi_ssid"
nmcli connection modify wifi wifi-sec.psk "$wifi_password"
nmcli connection up wifi
