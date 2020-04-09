LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wall -Wextra -Werror -Wunused
LOCAL_MODULE := goodixfingerprintd
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include
LOCAL_SRC_FILES := \
    GoodixFingerprintDaemonProxy.cpp \
    IGoodixFingerprintDaemon.cpp \
    IGoodixFingerprintDaemonCallback.cpp \
    goodixfingerprintd.cpp \
    GoodixFingerprintDaemonCallbackProxy.cpp
LOCAL_SHARED_LIBRARIES := \
    libbinder \
    liblog \
    libhardware \
    libutils \
    libgf_hal
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := libgoodixfingerprintd_binder
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../include
LOCAL_SRC_FILES := \
    IGoodixFingerprintDaemon.cpp \
    IGoodixFingerprintDaemonCallback.cpp \
    GoodixFingerprintDaemonCallbackProxy.cpp
LOCAL_SHARED_LIBRARIES := \
    libbinder \
    liblog \
    libhardware \
    libutils \
    libgf_hal
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)