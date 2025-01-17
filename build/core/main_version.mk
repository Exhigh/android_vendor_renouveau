PRODUCT_VERSION = 9.0
ifneq ($(RENOUVEAU_BUILDTYPE),)
PRODUCT_BUILD := Renouveau-v$(PRODUCT_VERSION)-$(shell date +%Y%m%d)-$(RENOUVEAU_BUILD)-$(RENOUVEAU_BUILDTYPE)
else
PRODUCT_BUILD := Renouveau-v$(PRODUCT_VERSION)-$(shell date +%Y%m%d)-$(RENOUVEAU_BUILD)-Unofficial
endif

# RR System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.rr.version=$(PRODUCT_BUILD) \
    ro.rr.releasetype=$(RENOUVEAU_BUILDTYPE) \
    ro.rr.build.version=$(PRODUCT_VERSION) \
    ro.modversion=$(PRODUCT_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal \
    rr.ota.version= $(shell date +%Y%m%d) \
    ro.rr.tag=$(shell grep "refs/tags" .repo/manifest.xml  | cut -d'"' -f2 | cut -d'/' -f3)

# RR Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.rr.display.version=$(PRODUCT_VERSION)

# RR Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.rr.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

# Renouveau System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.renouveau.version=$(PRODUCT_BUILD) \
    ro.renouveau.releasetype=$(RENOUVEAU_BUILDTYPE) \
    ro.renouveau.build.version=$(PRODUCT_VERSION) \
    renouveau.ota.version=$(shell date +%Y%m%d) \
    ro.renouveau.tag=$(shell grep "refs/tags" .repo/manifest.xml | cut -d'"' -f2 | cut -d'/' -f3) \
    ro.modversion=$(PRODUCT_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal


# Renouveau Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.renouveau.display.version=$(PRODUCT_VERSION)

# Renouveau Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.renouveau.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.rr.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION) \
    ro.renouveau.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# Allow ADB debugging for experimental builds during the boot process
ifeq ($(RENOUVEAU_BUILDTYPE),Experimental)
ADDITIONAL_BUILD_PROPERTIES += \
	ro.secure=0 \
	ro.debuggable=1 \
	persist.service.adb.enable=1 \
	persist.sys.usb.config=mtp,adb \
	ro.adb.secure=0
endif
