LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := dtbimg.c
LOCAL_STATIC_LIBRARIES := libexynos_fdt
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libexynos_fdt
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/libdtbimg

LOCAL_MODULE := libdtbimg

include $(BUILD_HOST_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := mkbootimg.c
LOCAL_STATIC_LIBRARIES := libdtbimg libexynos_fdt

LOCAL_MODULE := mkdtbhbootimg

include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := unpackbootimg.c
LOCAL_MODULE := unpackdtbhbootimg
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := mkdtbimg.c
LOCAL_STATIC_LIBRARIES := libdtbimg libexynos_fdt

LOCAL_MODULE := dtbhtoolExynos

include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := mkbootimg.c
LOCAL_STATIC_LIBRARIES := libexynos_fdt libcutils libc
LOCAL_MODULE := utility_mkdtbhbootimg
LOCAL_MODULE_STEM := mkdtbhbootimg
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := unpackbootimg.c
LOCAL_STATIC_LIBRARIES := libcutils libc
LOCAL_MODULE := utility_unpackdtbhbootimg
LOCAL_MODULE_STEM := unpackdtbhbootimg
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

$(call dist-for-goals,dist_files,$(LOCAL_BUILT_MODULE))

include $(LOCAL_PATH)/libexynos_fdt/Android.mk
