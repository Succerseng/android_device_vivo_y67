LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    icu55.c \
    mtk_audio.cpp \
    mtk_gui.cpp \
    mtk_omx.cpp \
    mtk_ui.cpp \
    mtk_xlog.cpp \
    mtk_camera.cpp \
    mtk_volte.cpp \
    mtk_vtservice.cpp \
    ssl.c

# only for 32bit libraries
LOCAL_SRC_FILES_32 := mtk_string.cpp
LOCAL_SRC_FILES_32 += mtk_wvm32.cpp
# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp
LOCAL_SRC_FILES_64 += mtk_wvm64.cpp

LOCAL_C_INCLUDES += \
    frameworks/av \
	frameworks/av/media/mtp \
	system/core \
	frameworks/rs/server \
	hardware/libhardware

LOCAL_SHARED_LIBRARIES := libbinder libutils liblog libgui libssl libui libicuuc libicui18n libcrypto libstagefright_foundation

LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
