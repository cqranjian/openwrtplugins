
include $(TOPDIR)/rules.mk

PKG_NAME:=feixun
PKG_VERSION:=1.0.1
PKG_RELEASE:=1
PKG_DATE:=20201223

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


include $(INCLUDE_DIR)/package.mk

define Package/feixun
  SECTION:=feixun Apps
  CATEGORY:=feixun Apps
  # DEPENDS:=+libubox-lua
  TITLE:=App feixun module
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile/Default

endef

define Package/feixun/conffiles
/etc/config/dc1
endef

define Package/feixun/description
  open feixun app
endef


define Package/feixun/install
	echo "install"
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/bin/dc1
	$(INSTALL_DIR) $(1)/etc/config

	$(INSTALL_BIN) ./files/dc1run.init $(1)/etc/init.d/dc1run
	
	$(INSTALL_BIN) ./files/dc1jk $(1)/usr/bin/dc1
	$(INSTALL_BIN) ./files/oyy_arm $(1)/usr/bin/dc1
	$(INSTALL_BIN) ./files/dc1.config $(1)/etc/config/dc1
endef


define Package/feixun/postinst
#!/bin/sh
chmod a+x $${IPKG_INSTROOT}/usr/bin/dc1/* >/dev/null 2>&1
exit 0
endef

$(eval $(call BuildPackage,feixun))

