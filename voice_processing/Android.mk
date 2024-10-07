ifneq ($(filter flo deb,$(TARGET_DEVICE)),)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    voice_processing_descriptors.c

LOCAL_C_INCLUDES += \
    $(call include-path-for, audio-effects) \
    hardware/libhardware/include \
    system/core/libcutils/include \
    system/media/audio/include

LOCAL_MODULE := libqcomvoiceprocessingdescriptors

LOCAL_MODULE_RELATIVE_PATH := soundfx

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_OWNER := qcom

LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)

endif
