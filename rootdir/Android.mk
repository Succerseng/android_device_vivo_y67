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

$(call add-rootdir-targets, \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.c2k.rc \
    init.common_svc.rc \
    init.factory.rc \
    init.mal.rc \
    init.modem.rc \
    fstab.mt6755 \
    init.mt6755.rc \
    init.mt6755.usb.rc \
    init.powermo.rc \
    init.project.rc \
    ueventd.mt6755.rc \
    init.trace.rc \
    init.trustonic.rc \
    init.usb.rc \
    init.vivo.rc \
    init.volte.rc \
    meta_init.c2k.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    init.xlog.rc \
    ueventd.rc)