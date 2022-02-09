export QTDIR=/usr/lib/qt
export PATH=$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins
for i in 3 4 5 6 7 8
do
	cat /sys/class/input/input$i/name 2>/dev/null | grep gt9xxnew_ts
	if [ $? -eq "0" ]; then
		export TSDEVICE=/dev/input/event$i
		export QT_QPA_GENERIC_PLUGINS=evdevtouch:/dev/input/event$i
	fi
done
export QWS_SIZE=480x272
export QT_QPA_FB_NO_LIBINPUT=1
export QT_QPA_PLATFORM=linuxfb:tty=/dev/fb0
export QT_QPA_FONTDIR=/usr/share/fonts

