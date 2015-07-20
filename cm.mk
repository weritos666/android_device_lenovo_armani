# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 854
TARGET_SCREEN_HEIGHT := 480

# Release name
PRODUCT_RELEASE_NAME := armani
PRODUCT_NAME := cm_armani

$(call inherit-product, device/lenovo/armani/full_armani.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=LENOVO \
    PRODUCT_NAME=armani \
    BUILD_PRODUCT=armani

