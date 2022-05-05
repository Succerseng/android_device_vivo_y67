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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# 是否生成一个成熟的recovery
# TARGET_RECOVERY_VERSION_TWRP := true

$(call inherit-product, device/vivo/y67/device.mk)

PRODUCT_DEVICE := y67
PRODUCT_NAME := full_y67
PRODUCT_BRAND := vivo
PRODUCT_MODEL := y67
PRODUCT_MANUFACTURER := vivo

# OTA更新
UPDATER_RUL := "http://succerseng.cc/rom/pd1612/update.json"
PRODUCT_PROPERTY_OVERRIDES += \
    cm.updater.uri=$(UPDATER_RUL)
    ro.cm.releasetype=UNOFFICIAL
