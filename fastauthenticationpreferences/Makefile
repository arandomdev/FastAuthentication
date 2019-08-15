ARCHS = arm64

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FastAuthenticationPreferences

FastAuthenticationPreferences_FILES = FAPRootListController.m
FastAuthenticationPreferences_INSTALL_PATH = /Library/PreferenceBundles
FastAuthenticationPreferences_FRAMEWORKS = UIKit
FastAuthenticationPreferences_PRIVATE_FRAMEWORKS = Preferences
FastAuthenticationPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FastAuthenticationPreferences.plist$(ECHO_END)
