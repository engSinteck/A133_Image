cmd_library/libfdt/fdt_ro.o := or32-elf-gcc -Wp,-MD,library/libfdt/.fdt_ro.o.d -Wp,-MT,library/libfdt/fdt_ro.o -Iinclude -Iinclude/driver -Iinclude/service -Iinclude/system -Ilibrary/libfdt/include -Iarch/openrisc/plat-sun50iw10p1/inc -Iservice/standby/suspend_resume/mem-sun50iw10p1/ -Iinclude/generated -include include/generated/autoconf.h -include conf.h -g -c -nostdlib -Wall -Werror -Os -mhard-mul -msoft-div -msoft-float -Ilibrary/libfdt/ -D"BUILD_STR(s)=$(pound)s" -D"KBUILD_NAME=BUILD_STR(fdt_ro)" -c -o library/libfdt/fdt_ro.o library/libfdt/fdt_ro.c

source_library/libfdt/fdt_ro.o := library/libfdt/fdt_ro.c

deps_library/libfdt/fdt_ro.o := \
  include/generated/autoconf.h \
  include/generated/conf.h \
  library/libfdt/include/libfdt_env.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/include/stddef.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/include/stdint.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/stdint.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/string.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/_ansi.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/newlib.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/sys/config.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/machine/ieeefp.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/sys/reent.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/_ansi.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/sys/_types.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/machine/_types.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/machine/_default_types.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/sys/lock.h \
  /home/rinaldo/allwinner/A133_Image/longan/brandy/arisc/ar100s/tools/toolchain/bin/../lib/gcc/or32-elf/4.5.1-or32-1.0rc4/../../../../or32-elf/include/sys/string.h \
  library/libfdt/include/fdt.h \
  library/libfdt/include/libfdt.h \
  library/libfdt/libfdt_internal.h \

library/libfdt/fdt_ro.o: $(deps_library/libfdt/fdt_ro.o)

$(deps_library/libfdt/fdt_ro.o):
