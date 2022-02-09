cmd_driver/timer/timer_cdelay.o := or32-elf-gcc -Wp,-MD,driver/timer/.timer_cdelay.o.d -Wp,-MT,driver/timer/timer_cdelay.o -Iinclude -Iinclude/driver -Iinclude/service -Iinclude/system -Ilibrary/libfdt/include -Iarch/openrisc/plat-sun50iw10p1/inc -Iservice/standby/suspend_resume/mem-sun50iw10p1/ -Iinclude/generated -include include/generated/autoconf.h -include conf.h -g -c -nostdlib -Wall -Werror -Os -mhard-mul -msoft-div -msoft-float -Idriver/timer/ -D"BUILD_STR(s)=$(pound)s" -D"KBUILD_NAME=BUILD_STR(timer_cdelay)" -c -o driver/timer/timer_cdelay.o driver/timer/timer_cdelay.S

source_driver/timer/timer_cdelay.o := driver/timer/timer_cdelay.S

deps_driver/timer/timer_cdelay.o := \
  include/generated/autoconf.h \
  include/generated/conf.h \

driver/timer/timer_cdelay.o: $(deps_driver/timer/timer_cdelay.o)

$(deps_driver/timer/timer_cdelay.o):
