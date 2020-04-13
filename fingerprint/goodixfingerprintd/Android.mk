LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libgoodixfingerprintd_binder
LOCAL_SRC_FILES_64 := arm64-v8a/libgoodixfingerprintd_binder.so
LOCAL_SRC_FILES_32 := armeabi-v7a/libgoodixfingerprintd_binder.so
LOCAL_SHARED_LIBRARIES := \
    libbinder \
    liblog \
    libhardware \
    libutils \
    libgf_hal
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)