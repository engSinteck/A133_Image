deps_config := \
	system/debugger/Kconfig \
	system/Kconfig \
	service/Kconfig \
	driver/watchdog/Kconfig \
	driver/twi/Kconfig \
	driver/pmu/Kconfig \
	driver/Kconfig \
	arch/openrisc/Kconfig \
	arch/Kconfig \
	Kconfig

include/config/auto.conf: \
	$(deps_config)


$(deps_config): ;
