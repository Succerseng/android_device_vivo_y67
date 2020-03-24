LOCAL_PATH:= $(call my-dir)

define add-rootdir-targets
$(foreach target,$(1), \
   $(eval include $(CLEAR_VARS)) \
   $(eval LOCAL_MODULE       := $(target)) \
   $(eval LOCAL_MODULE_CLASS := ETC) \
   $(eval LOCAL_SRC_FILES    := $(target)) \
   $(eval LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)) \
   $(eval include $(BUILD_PREBUILT)))
endef

#$(call add-rootdir-targets, \
    official_rc/factory_init.project.rc \
    official_rc/factory_init.rc \
    official_rc/init.aee.rc \
    official_rc/init.c2k.rc \
    official_rc/init.common_svc.rc \
    official_rc/init.factory.rc \
    official_rc/init.mal.rc \
    official_rc/init.modem.rc \
    official_rc/init.mt6755.rc \
    official_rc/init.mt6755.usb.rc \
    official_rc/init.powermo.rc \
    official_rc/init.project.rc \
    official_rc/ueventd.mt6755.rc \
    official_rc/init.trace.rc \
    official_rc/init.trustonic.rc \
    official_rc/init.usb.rc \
    official_rc/init.vivo.rc \
    official_rc/init.volte.rc \
    official_rc/init.xlog.rc \
    official_rc/ueventd.rc)

$(call add-rootdir-targets, \
    fstab.mt6755 \
    init.mt6755.rc \
    init.mt6755.modem.rc \
    init.mt6755.usb.rc \
    ueventd.mt6755.rc)

