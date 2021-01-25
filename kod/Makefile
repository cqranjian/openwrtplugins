# Copyright (C) 2018-2020 Lienol <lawlienol@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=appkod
PKG_VERSION:=1
PKG_RELEASE:=18
PKG_DATE:=20200729

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
#include $(INCLUDE_DIR)/kernel.mk

include $(INCLUDE_DIR)/package.mk

define Package/appkod
    SECTION:=kod Apps
    CATEGORY:=kod Apps
    DEPENDS:=+nginx-ssl +unzip +zoneinfo-asia +php7 +php7-fastcgi +php7-fpm +php7-mod-curl +php7-mod-dom +php7-mod-gd +php7-mod-iconv +php7-mod-json +php7-mod-mbstring +php7-mod-opcache +php7-mod-session +php7-mod-zip +php7-mod-sqlite3 +php7-mod-pdo +php7-mod-pdo-sqlite +php7-mod-pdo-mysql +php7-mod-simplexml
    TITLE:=App kod module
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
endef
 
define Build/Compile/Default
endef

define Package/appkod/description
  open appkod app
endef

define Package/appkod/install
    echo "install"
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) ./files/kodexplorer.init $(1)/etc/init.d/kodexplorer
	$(INSTALL_BIN) ./files/luci-app-kodexplorer.json $(1)/usr/share/rpcd/acl.d
	$(INSTALL_BIN) ./files/kodexplorer.config $(1)/etc/config/kodexplorer
  
endef



define Package/appkod/postinst
#!/bin/sh
chmod a+x $${IPKG_INSTROOT}/usr/share/rpcd/acl.d/* >/dev/null 2>&1
chmod a+x $${IPKG_INSTROOT}/etc/init.d/kodexplorer >/dev/null 2>&1
exit 0
endef

$(eval $(call BuildPackage,appkod))
