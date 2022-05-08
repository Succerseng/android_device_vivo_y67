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
    $(LOCAL_PATH)/configs/audio/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_em.xml:system/etc/audio_em.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-4096-hwui-memory.mk)

# Camera
PRODUCT_PACKAGES += \
    mtkcamera_parameters \
    Gallery2 \
    Snap

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/camerasize.xml:system/etc/camerasize.xml \
    $(LOCAL_PATH)/configs/camera/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    fs_config_files

# Charger Mode
PRODUCT_PACKAGES += \
    charger_res_images

# Charger and USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.usb.vid=0E8D

# Default.prop(ro.hardware.bbk：官方包的验证)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.hardware.bbk=PD1612MD

# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    libion
    
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# FM
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# Fingerprint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fingerprint/bin/fingerprintd:system/bin/fingerprintd \
    $(LOCAL_PATH)/fingerprint/bin/goodixfingerprintd:system/bin/goodixfingerprintd \
    $(LOCAL_PATH)/fingerprint/lib/libgf_algo.so:system/lib/libgf_algo.so \
    $(LOCAL_PATH)/fingerprint/lib/libgf_ca.so:system/lib/libgf_ca.so \
    $(LOCAL_PATH)/fingerprint/lib/libgf_hal.so:system/lib/libgf_hal.so \
    $(LOCAL_PATH)/fingerprint/lib/libgoodixfingerprintd_binder.so:system/lib/libgoodixfingerprintd_binder.so \
    $(LOCAL_PATH)/fingerprint/lib/hw/goodix_5126m.default.so:system/lib/hw/goodix_5126m.default.so \
    $(LOCAL_PATH)/fingerprint/lib/hw/goodix_5216c.default.so:system/lib/hw/goodix_5216c.default.so \
    $(LOCAL_PATH)/fingerprint/lib64/libgf_algo.so:system/lib64/libgf_algo.so \
    $(LOCAL_PATH)/fingerprint/lib64/libgf_ca.so:system/lib64/libgf_ca.so \
    $(LOCAL_PATH)/fingerprint/lib64/libgf_hal.so:system/lib64/libgf_hal.so \
    $(LOCAL_PATH)/fingerprint/lib64/libgoodixfingerprintd_binder.so:system/lib64/libgoodixfingerprintd_binder.so \
    $(LOCAL_PATH)/fingerprint/lib64/hw/goodix_5126m.default.so:system/lib64/hw/goodix_5126m.default.so \
    $(LOCAL_PATH)/fingerprint/lib64/hw/goodix_5216c.default.so:system/lib64/hw/goodix_5216c.default.so

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.fptype=goodix_5126m

# gps
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/agps/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \
    $(LOCAL_PATH)/configs/slp_conf:system/etc/slp_conf

PRODUCT_PACKAGES += \
    gps.mt6750 \
    libcurl \
    YGPS

# Graphics
MTK_GPU_VERSION := mali midgard r7p0

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Key Layouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayouts/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
    $(LOCAL_PATH)/keylayouts/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/omx/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
    $(LOCAL_PATH)/configs/omx/mtk_omx_core.cfg:system/vendor/etc/mtk_omx_core.cfg

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml
    
#PRODUCT_PROPERTY_OVERRIDES += \
#    media.stagefright.legacyencoder=true \
#    media.stagefright.less-secure=true

# Mediatek platform
PRODUCT_PACKAGES += \
   libmtk_symbols

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
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

# Radio dependencies
PRODUCT_PACKAGES += \
    muxreport \
    terservice

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_PACKAGES += \
    init.recovery.mt6755.rc

# Ril(开日志)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.ril.log=0 \
    ro.disable.xlog=0

# Power
PRODUCT_PACKAGES += \
    power.default \
    power.mt6750

# root
PRODUCT_PACKAGES += \
    enableswap.sh \
    goodix.rc \
    init.c2k.rc \
    init.mal.rc \
    init.mt6755.rc \
    init.mt6755.modem.rc \
    init.mt6755.usb.rc \
    init.project.rc \
    init.trustonic.rc \
    init.volte.rc \
    ueventd.mt6755.rc

PRODUCT_COPY_FILES += $(LOCAL_PATH)/rootdir/fstab.mt6755:root/fstab.mt6755

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# SU
PRODUCT_PACKAGES += \
    su

# Telephony
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0
PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds
PRODUCT_PROPERTY_OVERRIDES += ril.rilproxy=1

# Trust
PRODUCT_PROPERTY_OVERRIDES += \
    ro.mtk_trustonic_tee_support=1

# Volte
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles.xml:system/etc/vilte/viLTE_media_profiles.xml \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles_OP117.xml:system/etc/vilte/viLTE_media_profiles_OP117.xml \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles_OP18.xml:system/etc/vilte/viLTE_media_profiles_OP18.xml \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles_OP01.xml:system/etc/vilte/viLTE_media_profiles_OP01.xml \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles_OP12.xml:system/etc/vilte/viLTE_media_profiles_OP12.xml \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles_OP08.xml:system/etc/vilte/viLTE_media_profiles_OP08.xml \
    $(LOCAL_PATH)/configs/vilte/viLTE_media_profiles_OP122.xml:system/etc/vilte/viLTE_media_profiles_OP122.xml

PRODUCT_PACKAGES += \
    libcurl

# Vendor
VENDOR_BLOBS ?= vendor/vivo/y67/y67-vendor.mk
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
    lib_driver_cmd_mt66xx

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf
    
# xlog
PRODUCT_PACKAGES += \
    libxlog
