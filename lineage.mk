# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/vivo/y67/full_y67.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := VIVO Y67

PRODUCT_NAME := lineage_y67
BOARD_VENDOR := vivo
PRODUCT_DEVICE := y67

PRODUCT_GMS_CLIENTID_BASE := android-vivo

PRODUCT_DEFAULT_LANGUAGE := zh
PRODUCT_DEFAULT_REGION := CN
PRODUCT_LOCALES := zh_CN zh_TW en_US

PRODUCT_MANUFACTURER := VIVO
PRODUCT_MODEL := PD1612
TARGET_DEVICE := Y67
PRODUCT_BRAND := VIVO
TARGET_VENDOR := vivo
TARGET_VENDOR_PRODUCT_NAME := y67
TARGET_VENDOR_DEVICE_NAME := y67

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Shanghai

