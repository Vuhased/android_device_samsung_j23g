#
# Device configuration for j23g (SM-J200H), Android 9 Go
#

LOCAL_PATH := device/samsung/j23g

# Android Go defaults (low_ram etc.) - 1 GB RAM device
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)

# Inherit from vendor tree
$(call inherit-product-if-exists, vendor/samsung/j23g/j23g-vendor.mk)

# Inherit from scx30g2-common device configuration
$(call inherit-product, device/samsung/scx30g2-common/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# The 3.10 kernel has an OLD sdcardfs (derive=/split options) that Android 9's sdcard
# daemon cannot mount. Use the FUSE sdcard daemon instead (needs
# system_core_sdcard_fuse_restore.patch applied to system/core).
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.sdcardfs=false

# Offmode charger
PRODUCT_PACKAGES += \
    charger_res_images

# Low-RAM leftovers
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=10 \
    config.disable_atlas=true
