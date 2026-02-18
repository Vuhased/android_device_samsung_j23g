# Copyright 2006 The Android Open Source Project

ifeq ($(BOARD_PROVIDES_LIBRIL),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# Убрали обратный слэш после последнего активного файла
LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp \
    RilSocket.cpp

# Файлы RilSocket.cpp и RilSapSocket.cpp исключены из сборки

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy

LOCAL_STATIC_LIBRARIES := \
    libprotobuf-c-nano-enable_malloc

# Добавили пути к протобафам и системному RIL, чтобы не было ошибок "file not found"
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/../include \
    external/nanopb-c \
    hardware/ril/include \
    hardware/ril/librilutils \
    $(TOP)/hardware/ril/librilutils/proto
LOCAL_CFLAGS += -DSAP_NOT_USED

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/../include

LOCAL_MODULE:= libril
LOCAL_CLANG := true
LOCAL_SANITIZE := integer

include $(BUILD_SHARED_LIBRARY)

# For RdoServD which needs a static library
# =========================================
ifneq ($(ANDROID_BIONIC_TRANSITION),)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp

LOCAL_STATIC_LIBRARIES := \
    libutils_static \
    libcutils \
    librilutils_static \
    libprotobuf-c-nano-enable_malloc

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/../include \
    hardware/ril/include

LOCAL_MODULE:= libril_static

include $(BUILD_STATIC_LIBRARY)
endif # ANDROID_BIONIC_TRANSITION
endif # BOARD_PROVIDES_LIBRIL
