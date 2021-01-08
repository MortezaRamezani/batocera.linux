################################################################################
#
# hlsdk-xash3d-dmc
#
################################################################################

# "dmc" branch
HLSDK_XASH3D_DMC_VERSION = 2c76a059
HLSDK_XASH3D_DMC_SITE = $(call github,FWGS,hlsdk-xash3d,$(HLSDK_XASH3D_DMC_VERSION))
HLSDK_XASH3D_DMC_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_DMC_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_DMC_LICENSE_FILES = LICENSE

HLSDK_XASH3D_DMC_CONF_OPTS = -DGOLDSOURCE_SUPPORT=1 -DSERVER_LIBRARY_NAME=dmc -DGAMEDIR=dmc -DXASH_LINUX=1

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
HLSDK_XASH3D_DMC_CONF_OPTS += -DXASH_AMD64=1 -DXASH_64BIT=1 -D64BIT=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
HLSDK_XASH3D_DMC_CONF_OPTS += -DXASH_X86=1
endif

ifeq ($(BR2_aarch64),y)
HLSDK_XASH3D_DMC_CONF_OPTS += -DXASH_ARM=1 -DXASH_64BIT=1 -D64BIT=ON
else
HLSDK_XASH3D_DMC_CONF_OPTS += -DXASH_ARM=1
endif

define HLSDK_XASH3D_DMC_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/dmc/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/dmc/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))
