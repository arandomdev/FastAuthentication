ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = CoreAuthUI

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FastAuthentication

FastAuthentication_FILES = Tweak.x
FastAuthentication_CFLAGS = -fobjc-arc
FastAuthentication_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += fastauthenticationpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
