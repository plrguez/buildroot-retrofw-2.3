#############################################################
#
# mininit
#
#############################################################

MININIT_VERSION = master
MININIT_SITE = $(call github,retrofw,mininit,$(MININIT_VERSION))

TARGET_CONFIGURE_OPTS += CFLAGS="$(TARGET_CFLAGS) -DNO_LOOPCONTROL"

define MININIT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define MININIT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/mininit
	cp -r \
		$(@D)/license.txt \
		$(TARGET_DIR)/usr/share/mininit
	$(INSTALL) -m 0755 $(@D)/mininit-syspart $(BINARIES_DIR)/mininit-syspart
endef

$(eval $(generic-package))
