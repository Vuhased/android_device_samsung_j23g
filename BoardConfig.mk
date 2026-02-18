# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2024 The LineageOS Project

# Inherit from scx30g2 common configs
-include device/samsung/scx30g2-common/BoardConfigCommon.mk
-include vendor/samsung/j23g/BoardConfigVendor.mk

# Platform
TARGET_BOOTLOADER_BOARD_NAME := SC7730SE
TARGET_BOARD_PLATFORM := sc8830
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

# Kernel
TARGET_KERNEL_CONFIG := j23g-dt_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/j23g
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_ARCH := arm
# Единая, чистая строка CMDLINE
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive androidboot.dm_verity=off androidboot.connie=off printk.devkmsg=on

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5872025600
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Graphics (CRITICAL FIX)
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/j23g/configs/egl.cfg
BOARD_USE_MALI_TURBO := true
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
# Отключаем vsync для первой загрузки, чтобы не висело
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Legacy Support (Fixes for Oreo on old HALs)
TARGET_ENABLE_NON_PIE_SUPPORT := true
BOARD_SECCOMP_FILTER := false
TARGET_USES_64_BIT_BINDER := false
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DMAX_SERVICE_NAME_LENGTH=32

# RIL
TARGET_SPECIFIC_HEADER_PATH := device/samsung/j23g/include
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := samsung
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS := ../../../device/samsung/j23g/ril
TARGET_USES_OLD_RIL := true

# Wifi & Bluetooth
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
BOARD_HAVE_SAMSUNG_WIFI := true

# Treble & Vendor
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := false
# Важно: указываем папку vendor в root
BOARD_ROOT_EXTRA_FOLDERS := efs vendor
