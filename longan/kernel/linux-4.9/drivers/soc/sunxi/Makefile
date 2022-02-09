obj-$(CONFIG_SUNXI_SRAM) +=	sunxi_sram.o
obj-y +=        sunxi-sid.o
ifeq ($(strip $(CONFIG_ARCH_SUN50IW9)$(CONFIG_ARCH_SUN50IW10)),)
obj-$(CONFIG_PM) += pm.o
endif
obj-y += arisc/
obj-y += sunxi-dump.o
obj-m += vf-test.o
obj-y += vf-table.o
obj-$(CONFIG_GPU_PM_DOMAINS) += pm_domains.o
