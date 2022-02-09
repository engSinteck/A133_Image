#!/bin/sh
ps | grep dhclient 1>/dev/null 2>&1
if [ $? -eq "0" ]; then
	killall dhclient 1>/dev/null 2>&1
fi
ps | grep wpa_supplicant 1>/dev/null 2>&1
if [ $? -eq "0" ]; then
	killall wpa_supplicant 1>/dev/null 2>&1
	sleep 1
fi
wpa_supplicant 1>/dev/null -iwlan0 1>/dev/null -c /etc/wpa_supplicant.conf 2>&1 &
sleep 2
read -p "Enter your WIFI SSID: " wifi_ssid
wpa_cli -i wlan0 set_network 0 ssid '"'$wifi_ssid'"'
read -p "Enter your WIFI Password: " wifi_password
wpa_cli -i wlan0 set_network 0 psk '"'$wifi_password'"'
wpa_cli -i wlan0 save_config
wpa_cli -i wlan0 disable_network 0 1>/dev/null 2>&1
sleep 1
wpa_cli -i wlan0 enable_network 0 1>/dev/null 2>&1
sleep 1
dhclient wlan0 1>/dev/null 2>&1 &
