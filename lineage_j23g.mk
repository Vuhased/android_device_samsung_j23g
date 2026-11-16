#
# LineageOS 16.0 product makefile for j23g (Android 9 Go)
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration
$(call inherit-product, device/samsung/j23g/j23g.mk)

# Inherit some common Lineage stuff.
# 'mini' variant = fewer apps, fits 1.5 GB /system better on a 1 GB RAM Go device.
# If you want the full set of apps, use vendor/lineage/config/common_full_phone.mk instead.
$(call inherit-product, vendor/lineage/config/common_mini_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_j23g
PRODUCT_DEVICE := j23g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J200H
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
