# Copyright (C) 2020 The LineageOS Project
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
#

LOCAL_PATH := device/vivo/y67

# ADB Debugging
ifneq ($(TARGET_BUILD_VARIANT), user)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.mtk_gps_support=1 \
    ro.mtk_agps_app=1 \
    ro.secure=0
endif

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudiopolicymanagerdefault \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml \
    libfs_mgr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/a2dp_audio_policy_configuration.xml:system/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_em.xml:system/etc/audio_em.xml \
    $(LOCAL_PATH)/configs/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/configs/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Build proprietary bits when available
ifneq ($(MTKPATH),)
$(call inherit-product-if-exists, $(MTKPATH)/config/mt6755.mk)
endif

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-4096-hwui-memory.mk)

# Camera
PRODUCT_PACKAGES += \
    mtkcamera_parameters \
    Gallery2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/camerasize.xml:system/etc/camerasize.xml

# Charger Mode
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(TARGET_BUILD_VARIANT), user)
# Mediatek logging service
PRODUCT_PACKAGES += \
    mobile_log_d \
    netdiag \
    tcpdump
endif

# Charger and USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.usb.vid=2970

# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    libion

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.mt6755

# FM
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# GPS
PRODUCT_PACKAGES += \
    gps.mt6755 \
    YGPS

$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \
    $(LOCAL_PATH)/configs/slp_conf:system/etc/slp_conf

# Graphics
MTK_GPU_VERSION := mali midgard r7p0

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Include ov8858 s5k2p8
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/custom_hal/armeabi-v7a/libcam.halsensor.so:system/lib/libcam.halsensor.so \
    $(LOCAL_PATH)/camera/custom_hal/armeabi-v7a/libcam.metadataprovider.so:system/lib/libcam.metadataprovider.so \
    $(LOCAL_PATH)/camera/custom_hal/armeabi-v7a/libcam.paramsmgr.so:system/lib/libcam.paramsmgr.so \
    $(LOCAL_PATH)/camera/custom_hal/armeabi-v7a/libcam.metadata.so:system/lib/libcam.metadata.so \
    $(LOCAL_PATH)/camera/custom_hal/arm64-v8a/libcam.halsensor.so:system/lib64/libcam.halsensor.so \
    $(LOCAL_PATH)/camera/custom_hal/arm64-v8a/libcam.metadataprovider.so:system/lib64/libcam.metadataprovider.so \
    $(LOCAL_PATH)/camera/custom_hal/arm64-v8a/libcam.paramsmgr.so:system/lib64/libcam.paramsmgr.so \
    $(LOCAL_PATH)/camera/custom_hal/arm64-v8a/libcam.metadata.so:system/lib64/libcam.metadata.so

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/init.goodix.fingerprint.rc:root/init.goodix.fingerprint.rc

# Key Layouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayouts/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
    $(LOCAL_PATH)/configs/keylayouts/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Mediatek platform
PRODUCT_PACKAGES += \
   libmtk_symbols

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Prebuilt
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/camera/custom/lib/libsec_mem.so:system/lib/libsec_mem.so \
    $(LOCAL_PATH)/prebuilt/camera/custom/lib64/libsec_mem.so:system/lib64/libsec_mem.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libhdrproc.so:system/lib/libhdrproc.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libMtkOmxCore.so:system/lib/libMtkOmxCore.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libMtkOmxVdecEx.so:system/lib/libMtkOmxVdecEx.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libMtkOmxVenc.so:system/lib/libMtkOmxVenc.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libvcodecdrv.so:system/lib/libvcodecdrv.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libvcodec_utility.so:system/lib/libvcodec_utility.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libMtkOmxWmaDec.so:system/lib/libMtkOmxWmaDec.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libvcodec_cap.so:system/lib/libvcodec_cap.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib/libvcodec_oal.so:system/lib/libvcodec_oal.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib64/libhdrproc.so:system/lib64/libhdrproc.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib64/libMtkOmxCore.so:system/lib64/libMtkOmxCore.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib64/libvcodecdrv.so:system/lib64/libvcodecdrv.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib64/libvcodec_utility.so:system/lib64/libvcodec_utility.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib64/libvcodec_cap.so:system/lib64/libvcodec_cap.so \
    $(LOCAL_PATH)/prebuilt/camera/marshmallow/lib64/libvcodec_oal.so:system/lib64/libvcodec_oal.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib/libbwc.so:system/lib/libbwc.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib/libgui_ext.so:system/lib/libgui_ext.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib/libm4u.so:system/lib/libm4u.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib/libmtkcam_fwkutils.so:system/lib/libmtkcam_fwkutils.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib/librrc.so:system/lib/librrc.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib/libui_ext.so:system/lib/libui_ext.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib64/libbwc.so:system/lib64/libbwc.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib64/libgui_ext.so:system/lib64/libgui_ext.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib64/libm4u.so:system/lib64/libm4u.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib64/libmtkcam_fwkutils.so:system/lib64/libmtkcam_fwkutils.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib64/librrc.so:system/lib64/librrc.so \
    $(LOCAL_PATH)/prebuilt/camera/nougat/lib64/libui_ext.so:system/lib64/libui_ext.so \
    $(LOCAL_PATH)/prebuilt/fm/custom/lib/hw/radio.fm.mt6755.so:system/lib/hw/radio.fm.mt6755.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/6620_launcher:system/bin/6620_launcher \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/6620_wmt_concurrency:system/bin/6620_wmt_concurrency \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/6620_wmt_lpbk:system/bin/6620_wmt_lpbk \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/ccci_fsd:system/bin/ccci_fsd \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/ccci_mdinit:system/bin/ccci_mdinit \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/gsm0710muxd:system/bin/gsm0710muxd \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/gsm0710muxdmd2:system/bin/gsm0710muxdmd2 \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/mtkrild:system/bin/mtkrild \
    $(LOCAL_PATH)/prebuilt/ril/custom/bin/mtkrildmd2:system/bin/mtkrildmd2 \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal.so:system/lib/libmal.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_datamngr.so:system/lib/libmal_datamngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_epdga.so:system/lib/libmal_epdga.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_imsmngr.so:system/lib/libmal_imsmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_mdmngr.so:system/lib/libmal_mdmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_nwmngr.so:system/lib/libmal_nwmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_rds.so:system/lib/libmal_rds.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_rilproxy.so:system/lib/libmal_rilproxy.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmal_simmngr.so:system/lib/libmal_simmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/libmdfx.so:system/lib/libmdfx.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/librilmtk.so:system/lib/librilmtk.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/librilmtkmd2.so:system/lib/librilmtkmd2.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/mtk-ril.so:system/lib/mtk-ril.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib/mtk-rilmd2.so:system/lib/mtk-rilmd2.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal.so:system/lib64/libmal.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_datamngr.so:system/lib64/libmal_datamngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_epdga.so:system/lib64/libmal_epdga.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_imsmngr.so:system/lib64/libmal_imsmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_mdmngr.so:system/lib64/libmal_mdmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_nwmngr.so:system/lib64/libmal_nwmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_rds.so:system/lib64/libmal_rds.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_rilproxy.so:system/lib64/libmal_rilproxy.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmal_simmngr.so:system/lib64/libmal_simmngr.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/libmdfx.so:system/lib64/libmdfx.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/librilmtk.so:system/lib64/librilmtk.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/librilmtkmd2.so:system/lib64/librilmtkmd2.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/mtk-ril.so:system/lib64/mtk-ril.so \
    $(LOCAL_PATH)/prebuilt/ril/custom/lib64/mtk-rilmd2.so:system/lib64/mtk-rilmd2.so

# Power
PRODUCT_PACKAGES += \
    power.mt6755

# Radio dependencies
PRODUCT_PACKAGES += \
    muxreport \
    terservice

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := y67,pd1612

# Recovery Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ramdisk/sbin/fuelgauged_static:recovery/root/sbin/fuelgauged_static \
    $(LOCAL_PATH)/rootdir/init.recovery.mt6755.rc:recovery/root/init.recovery.mt6755.rc

# Root
PRODUCT_PACKAGES += \
    fstab.mt6755 \
    init.mt6755.rc \
    init.mt6755.modem.rc \
    init.mt6755.usb.rc \
    ueventd.mt6755.rc

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Telephony
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0
PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds

# Thermal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/.ht120.mtc:system/etc/.tp/.ht120.mtc \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/.thermal_meta.conf:system/etc/.tp/.thermal_meta.conf \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/.thermal_policy_02:system/etc/.tp/.thermal_policy_02 \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/thermal.conf:system/etc/.tp/thermal.conf \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/thermal.high.conf:system/etc/.tp/thermal.high.conf \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/thermal.low.conf:system/etc/.tp/thermal.low.conf \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/thermal.mid.conf:system/etc/.tp/thermal.mid.conf \
	$(LOCAL_PATH)/prebuilt/thermal/custom/etc/.tp/thermal.off.conf:system/etc/.tp/thermal.off.conf \
	$(LOCAL_PATH)/prebuilt/thermal/custom/bin/thermal:system/bin/thermal \
	$(LOCAL_PATH)/prebuilt/thermal/custom/bin/thermal_manager:system/bin/thermal_manager \
	$(LOCAL_PATH)/prebuilt/thermal/custom/bin/thermald:system/bin/thermald \
	$(LOCAL_PATH)/prebuilt/thermal/custom/bin/thermalloadalgod:system/bin/thermalloadalgod

# Vendor
VENDOR_BLOBS ?= vendor/vivo/y67/y67-vendor.mk
#$(call inherit-product-if-exists, $(VENDOR_BLOBS))
$(call inherit-product, $(VENDOR_BLOBS))

# Versioning
PRODUCT_PROPERTY_OVERRIDES += \
    ro.mediatek.version.release=$(MTK_BUILD_VERNO) \
    ro.mediatek.chip_ver=$(MTK_CHIP_VER)

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf