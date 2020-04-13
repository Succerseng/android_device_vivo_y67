LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libgf_hal
LOCAL_SRC_FILES_64 := debug/arm64-v8a/libgf_hal.so
LOCAL_SRC_FILES_32 := debug/armeabi-v7a/libgf_hal.so
LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libgf_ca \
    libgf_algo
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libgf_algo
LOCAL_SRC_FILES_64 := debug/arm64-v8a/libgf_algo.so
LOCAL_SRC_FILES_32 := debug/armeabi-v7a/libgf_algo.so
LOCAL_SHARED_LIBRARIES := \
    libcutils
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libgf_ca
LOCAL_SRC_FILES_64 := debug/arm64-v8a/libgf_ca.so
LOCAL_SRC_FILES_32 := debug/armeabi-v7a/libgf_ca.so
LOCAL_SHARED_LIBRARIES := \
    libcutils
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)