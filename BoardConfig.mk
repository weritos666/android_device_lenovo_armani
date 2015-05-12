#
# Copyright (C) 2014 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version

LOCAL_PATH := device/dns/s4503

-include vendor/huawei/msm7x27a-common/BoardConfigVendor.mk

-include device/dns/s4503/kernel/Android.mk

TARGET_SPECIFIC_HEADER_PATH := device/dns/s4503/include

# cflags
# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
TARGET_USES_ION := true
BOARD_USES_QCOM_LIBS := true
TARGET_USES_QCOM_BSP := true
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a5
TARGET_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a5

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
# Try to use ASHMEM if possible (when non-MDP composition is used)
TARGET_GRALLOC_USES_ASHMEM := true

# Arch related defines and optimizations
TARGET_ARCH := arm
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOOTLOADER_BOARD_NAME := 7х27
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CORTEX_CACHE_LINE_32 := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
BOARD_USES_ADRENO_200 := true

# Inline kernel building
#TARGET_NO_KERNEL := true
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/zImage:kernel

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USES_UNCOMPRESSED_KERNEL := false

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom loglevel=1 vmalloc=200M 

ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_EGL_CFG := device/dns/s4503/config/egl.cfg

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 465568000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2920577761
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE := 41943040
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
#TARGET_NO_RECOVERY := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_CACHE_DEVICE := /dev/block/mmcblk0p15
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p12
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p13
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw

# Audio
TARGET_PROVIDES_LIBAUDIO := true
TARGET_HAS_QACT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/dns/s4503/bluetooth

# Dalvik
TARGET_ARCH_LOWMEM := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/dns/s4503/cmhw/

# Display
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/dns/s4503/config/egl.cfg
TARGET_QCOM_DISPLAY_VARIANT := legacy
USE_OPENGL_RENDERER := true

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# SEPOLICY
BOARD_SEPOLICY_DIRS := \
       device/dns/s4503/sepolicy

BOARD_SEPOLICY_UNION := \
       device.te \
       file_contexts

# Media
TARGET_QCOM_MEDIA_VARIANT := caf

# Assert
TARGET_OTA_ASSERT_DEVICE := s4503,s4503_t,msm8625_i6,msm8625_d9

# Vold
BOARD_VOLD_MAX_PARTITIONS := 19
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

TARGET_PROVIDES_LIBLIGHT := true

BOARD_CHARGER_ENABLE_SUSPEND := true

# Camera
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
USE_DEVICE_SPECIFIC_CAMERA := true
USE_CAMERA_STUB :=false

# Web Rendering
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

DISABLE_DEXPREOPT := true

# RIL
BOARD_RIL_CLASS := ../../../device/dns/s4503/ril/

DEVICE_RESOLUTION := 940x560

# Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HAS_ATH_WLAN := true
BOARD_WLAN_DEVICE := ath6kl
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/ath6kl/cfg80211.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/dns/s4503/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/dns/s4503/rootdir/fstab.dns
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/dns/s4503/recovery/recovery-keys.c
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_RECOVERY_INITRC := device/dns/s4503/recovery/init.rc
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
