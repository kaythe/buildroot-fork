################################################################################
#
# wolfTPM
#
################################################################################

WOLFTPM_VERSION = 1.4
WOLFTPM_SOURCE = v$(WOLFTPM_VERSION).tar.gz
WOLFTPM_SITE = https://github.com/wolfSSL/wolfTPM/archive
WOLFTPM_INSTALL_STAGING = YES
WOLFTPM_DEPENDENCIES = wolfssl
WOLFTPM_AUTORECONF = YES

define WOLFTPM_CREATE_RPATH_FILE
	@echo "WTF"
	@echo $(value $(@D))
	mkdir -p "$(@D)/build-aux"
	touch "$(@D)/build-aux/config.rpath"
endef

WOLFTPM_POST_EXTRACT_HOOKS += WOLFTPM_CREATE_RPATH_FILE

$(eval $(autotools-package))
