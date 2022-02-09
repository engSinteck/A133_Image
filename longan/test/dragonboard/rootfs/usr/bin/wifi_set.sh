#!/bin/sh
stty erase ^h
read -p "Enter your WIFI SSID: " wifi_ssid
read -p "Enter your WIFI Password: " wifi_password
nmcli device wifi connect "$wifi_ssid" password "$wifi_password" name wifi
