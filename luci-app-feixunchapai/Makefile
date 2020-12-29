include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-feixunchapai
PKG_VERSION:=1.0.1
PKG_RELEASE:=1
PKG_DATE:=20201223

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	CATEGORY:=LuCI
    SUBMENU:=3. Applications
	TITLE:=LuCI Support for feixunchapai
	PKGARCH:=all
endef

define Build/Prepare
endef
 
define Build/Configure
endef
 
define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/dc1
endef


define Package/$(PKG_NAME)/install
    $(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/dc1 $(1)/etc/config/dc1
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/dc1run $(1)/etc/init.d/dc1run
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci/
	
	
	$(INSTALL_DIR) $(1)/usr/bin/dc1
	$(INSTALL_BIN) ./root/usr/bin/dc1/dc1jk $(1)/usr/bin/dc1/dc1jk
	$(INSTALL_BIN) ./root/usr/bin/dc1/oyy_arm $(1)/usr/bin/dc1/oyy_arm
endef



define Package/$(PKG_NAME)/postinst
#!/bin/sh
chmod a+x $${IPKG_INSTROOT}/usr/bin/dc1/* >/dev/null 2>&1
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
