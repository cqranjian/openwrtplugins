# Copyright (C) 2018-2020 Lienol <lawlienol@gmail.com>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pptpvpn
PKG_VERSION:=1.1
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
#include $(INCLUDE_DIR)/kernel.mk

define Package/pptpvpn
    SECTION:=pptpvpn Apps
    CATEGORY:=pptpvpn Apps
    DEPENDS:=+pptpd +kmod-mppe +ppp
    TITLE:=App pptp-vpnserver module	
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
endef
 
define Build/Compile/Default

endef

define Package/pptpvpn/description
  open pptp-vpnserver app
endef

define Package/pptpvpn/install
    echo "install"
	$(INSTALL_DIR) $(1)/usr/share/pptpd $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) ./files/pptpd.init $(1)/etc/init.d/pptpd
	$(INSTALL_BIN) ./files/firewall.include $(1)/usr/share/pptpd
	$(INSTALL_BIN) ./files/pptpd.config $(1)/etc/config/pptpd
  
endef



define Package/pptpvpn/postinst
#!/bin/sh
chmod a+x $${IPKG_INSTROOT}/usr/share/pptpd/* >/dev/null 2>&1
chmod a+x $${IPKG_INSTROOT}/etc/init.d/pptpd >/dev/null 2>&1
exit 0
endef

$(eval $(call BuildPackage,pptpvpn))



