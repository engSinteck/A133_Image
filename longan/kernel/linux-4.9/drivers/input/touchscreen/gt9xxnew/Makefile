#
# Makefile for the touchscreen drivers.
#

# Each configuration option enables a list of files.

obj-$(CONFIG_TOUCHSCREEN_GT9XXNEW_TS)          += gt9xxnew_ts.o
obj-$(CONFIG_TOUCHSCREEN_GT9XXNEWDUP_TS)       += gt9xxnewdup_ts.o
gt9xxnew_ts-objs := goodix_tool.o gt9xx_update.o gt9xx.o
gt9xxnewdup_ts-objs := goodix_tool.o gt9xx_update.o gt9xxdup.o
ccflags-y  += -Wno-format -Wno-unused-function

