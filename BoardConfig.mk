#
# Copyright (C) 2016 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_BOARD_PLATFORM := mt6755

DEVICE_PATH := device/vivo/y67

# Disable NINJA
#USE_NINJA := false
#BLOCK_BASED_OTA := true

# FLash
#USE_F2FS_FORMAT_EXT4 := true
#LOCAL_BINARY_PATH := /sbin/local_binary
#FLASH_VERIFICATION_NAME := $(PRODUCT_DEVICE)

MTK_PROJECT_CONFIG ?= $(DEVICE_PATH)/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)
include device/cyanogen/mt6755-common/BoardConfigCommon.mk

MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))

BOARD_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
BOARD_GLOBAL_CPPFLAGS += $(MTK_INTERNAL_CDEFS)

# Fingerprint
MTK_FINGERPRINT_SUPPORT := yes
#USE_EXTRACT_GOODIX_BLOB := yes

#GPS
USE_PREBUILD_GPS_BLOB := yes

# Support of MTK NFC
MTK_NFC_SUPPORT := no

# Kernel informations
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 enforcing=0 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --board 1465391499 --ramdisk_offset 0x04f88000 --second_offset 0x00e88000 --tags_offset 0x03f88000

TARGET_PREBUILT_KERNEL := device/vivo/y67/prebuilt/kernel
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
TARGET_BOOTLOADER_BOARD_NAME := y67

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 32777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 402984832
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3029848320
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 32879521280
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

USE_TWRP := yes
MCDEVICEDAEMON_PD1612 := true
# Twrp
ifeq ($(USE_TWRP), yes)
TW_DEFAULT_BRIGHTNESS := 25
TW_EXCLUDE_TWRPAPP := true
TW_MAX_BRIGHTNESS := 255
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := zh_CN
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := yes
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_SUPERSU := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
PRODUCT_COPY_FILES += $(DEVICE_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab
ifeq ($(MCDEVICEDAEMON_PD1612), true)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/ramdisk/system/bin/mcDriverDaemon:recovery/root/sbin/mcDriverDaemon \
    $(DEVICE_PATH)/rootdir/ramdisk/system/lib64/libMcClient_vivo.so:recovery/root/system/lib64/libMcClient_vivo.so \
    $(DEVICE_PATH)/rootdir/ramdisk/vendor/lib64/hw/keystore.mt6755.so:recovery/root/vendor/lib64/hw/keystore.mt6755.so \
    $(DEVICE_PATH)/rootdir/ramdisk/system/app/mcRegistry/020f0000000000000000000000000000.drbin:recovery/root/system/app/mcRegistry/020f0000000000000000000000000000.drbin \
    $(DEVICE_PATH)/rootdir/ramdisk/system/app/mcRegistry/05120000000000000000000000000000.drbin:recovery/root/system/app/mcRegistry/05120000000000000000000000000000.drbin \
    $(DEVICE_PATH)/rootdir/ramdisk/system/app/mcRegistry/070b0000000000000000000000000000.drbin:recovery/root/system/app/mcRegistry/070b0000000000000000000000000000.drbin \
    $(DEVICE_PATH)/rootdir/init.vivo.mcDeviceDaemon.rc:recovery/root/init.vivo.mcDeviceDaemon.rc
ifeq ($(LOCAL_BINARY_PATH),)
PRODUCT_PACKAGE := local_binary
endif
endif
endif
