PACKAGE_VERSION = 1.0.6
DEBUG = 0
ARCHS = armv7 arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = UnsplashWallsXI
UnsplashWallsXI_FILES = UnsplashWallsXIRootListController.m
UnsplashWallsXI_INSTALL_PATH = /Library/PreferenceBundles
UnsplashWallsXI_FRAMEWORKS = UIKit
UnsplashWallsXI_PRIVATE_FRAMEWORKS = Preferences PhotoLibrary

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/UnsplashWallsXI.plist$(ECHO_END)
