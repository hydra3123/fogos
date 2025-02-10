#
# Copyright (C) 2022 The LineageOS Project
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
#

DEVICE_PATH := device/motorola/fogos

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := fogos

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=fogos
TARGET_KERNEL_CONFIG := vendor/fogos-qgki-inline_defconfig

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/configs/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 5901385728 # ((SUPER_PARTITION_SIZE / 2) - 4194304)
BOARD_SUPER_PARTITION_SIZE := 5905580032

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/properties/product.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# AVB
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 12
BOARD_AVB_ROLLBACK_INDEX := 12

# Security Patch
BOOT_SECURITY_PATCH := 2024-11-01
VENDOR_SECURITY_PATCH := 2024-11-01

# inherit from the proprietary version
include vendor/motorola/fogos/BoardConfigVendor.mk