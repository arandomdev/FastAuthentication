ARCHS = arm64

INSTALL_TARGET_PROCESSES = CoreAuthUI

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FastAuthentication

FastAuthentication_FILES = Tweak.x
FastAuthentication_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += fastauthenticationpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
