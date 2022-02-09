#######################################################
# Filename     : 4g_set.sh
# Last modified: 2021-04-07 15:45
# Author       : jzzh
# Email        : jzzh@szbaijie.cn
# Company site : http://www.szbaijie.cn/index.php
# Description  : 
#######################################################
#!/bin/sh

gpio-test.64 w h 12 1
sleep 5
if [ ! -f "/etc/NetworkManager/system-connections/ppp0" ];then
    #nmcli connection delete ppp0
    nmcli connection add con-name ppp0 ifname ttyUSB2 autoconnect yes \
    type gsm apn 3gnet user uninet password uninet
fi
