#
# Copyright (C) 2011 The Android Open-Source Project
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

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_IMAGE_NAME = zImage
BOARD_KERNEL_PAGESIZE := 2048
# BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=msm8960 maxcpus=2
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=flo user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
TARGET_KERNEL_SOURCE := kernel/google/msm
TARGET_KERNEL_CONFIG := followmsi_defconfig

# QCOM Hardware
BOARD_USES_QCOM_HARDWARE := true

TARGET_HAS_MEMFD_BACKPORT := true

# Audio
BOARD_USES_ALSA_AUDIO:= true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Dedupe VNDK libraries with identical core variants.
TARGET_VNDK_USE_CORE_VARIANT := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/flo/bluetooth

# Display
TARGET_SCREEN_DENSITY := 320

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_OPENGL_RENDERER := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 3200000
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 880803840 # 840M (STOCK)
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 943718400 # 900M
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 996147200 # 950M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1153433600 # 1100M
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1336934400 # 1275M

#Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

BOARD_ROOT_EXTRA_FOLDERS := \
    persist \
    firmware

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

BOARD_USERDATAIMAGE_PARTITION_SIZE := 12348030976 # 11.5G
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_SECURE_SERVICES := true

TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U

TARGET_DISABLE_POSTRENDER_CLEANUP := true

USE_CAMERA_STUB := false
BOARD_USES_CAMERA_FAST_AUTOFOCUS := false

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 587202560

BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880

TARGET_USES_POST_PROCESSING := true
TARGET_CUSTOM_DISPLAY_TUNING := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true

HAVE_ADRENO_SOURCE:= false

SELINUX_IGNORE_NEVERALLOWS := true

include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += device/asus/flo/sepolicy

# Security Patch Level
VENDOR_SECURITY_PATCH := 2016-08-05

BUILD_BROKEN_DUP_RULES := true

# Media HAL
BOARD_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
BOARD_GLOBAL_CPPFLAGS += -DQCOM_BSP_LEGACY

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Fonts
#EXCLUDE_SERIF_FONTS := true
#SMALLER_FONT_FOOTPRINT := true

# Recovery
TARGET_RECOVERY_DENSITY := hdpi

include vendor/asus/flo/BoardConfigVendor.mk
