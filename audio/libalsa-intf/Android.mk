LOCAL_PATH:= $(call my-dir)

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)
# Any prebuilt files with default TAGS can use the below:
include $(CLEAR_VARS)
LOCAL_MODULE       := snd_soc_msm
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/snd_soc_msm
LOCAL_SRC_FILES    := snd_soc_msm/snd_soc_msm
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := snd_soc_msm_2x
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/snd_soc_msm
LOCAL_SRC_FILES    := snd_soc_msm/snd_soc_msm_2x
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := snd_soc_msm_2x_Fusion3
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/snd_soc_msm
LOCAL_SRC_FILES    := snd_soc_msm/snd_soc_msm_2x_Fusion3
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := snd_soc_msm_Sitar
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/snd_soc_msm
LOCAL_SRC_FILES    := snd_soc_msm/snd_soc_msm_Sitar
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= aplay.c alsa_pcm.c alsa_mixer.c
LOCAL_SRC_FILES:= aplay.c
LOCAL_MODULE:= aplay
LOCAL_SHARED_LIBRARIES:= libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= arec.c alsa_pcm.c
LOCAL_SRC_FILES:= arec.c
LOCAL_MODULE:= arec
LOCAL_SHARED_LIBRARIES:= libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= amix.c
LOCAL_MODULE:= amix
LOCAL_SHARED_LIBRARIES := libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= alsaucm_test.c
LOCAL_MODULE:= alsaucm_test
LOCAL_SHARED_LIBRARIES:= libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO   := mm-audio/libalsa-intf
LOCAL_COPY_HEADERS      := alsa_audio.h
LOCAL_COPY_HEADERS      += alsa_ucm.h
LOCAL_COPY_HEADERS      += msm8960_use_cases.h
LOCAL_SRC_FILES:= alsa_mixer.c alsa_pcm.c alsa_ucm.c
LOCAL_MODULE:= libalsa-intf
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES:= libc libcutils #libutils #libmedia libhardware_legacy
LOCAL_CFLAGS := -DCONFIG_DIR=\"/system/etc/snd_soc_msm/\"
ifeq ($(strip $(QC_PROP)),true)
LOCAL_CFLAGS := -DQC_PROP -DCONFIG_DIR=\"/system/etc/snd_soc_msm/\"
LOCAL_SHARED_LIBRARIES += libacdbloader
LOCAL_ADDITIONAL_DEPENDENCIES  := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/audio-acdb-util
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
endif
ifeq ($(TARGET_SIMULATOR),true)
 LOCAL_LDLIBS += -ldl
else
 LOCAL_SHARED_LIBRARIES += libdl
endif
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
endif
