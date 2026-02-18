$(call inherit-product, vendor/lineage/config/telephony.mk)
$(call inherit-product, vendor/lineage/config/common.mk)
$(call inherit-product, $(LOCAL_PATH)/j23g.mk)

PRODUCT_DEVICE := j23g
PRODUCT_NAME := lineage_j23g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J200H
PRODUCT_MANUFACTURER := samsung

# Treble Override
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Ramdisk & Init
PRODUCT_COPY_FILES += \
    device/samsung/j23g/rootdir/init.sc8830.rc:root/init.sc8830.rc \
    device/samsung/j23g/rootdir/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
    device/samsung/j23g/rootdir/fstab.sc8830:root/fstab.sc8830 \
    device/samsung/j23g/selinux_stub/property_contexts:root/prop.default

# Graphics Config (Создай этот файл!)
PRODUCT_COPY_FILES += \
    device/samsung/j23g/configs/egl.cfg:system/lib/egl/egl.cfg

# Wi-Fi (кладем в system/etc, чтобы точно нашлось)
PRODUCT_COPY_FILES += \
    device/samsung/j23g/wifi/bcmdhd_sta.bin:system/etc/wifi/bcmdhd_sta.bin \
    device/samsung/j23g/wifi/bcmdhd_apsta.bin:system/etc/wifi/bcmdhd_apsta.bin \
    device/samsung/j23g/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
