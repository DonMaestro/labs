# Created by the Intel FPGA Monitor Program
# DO NOT MODIFY

############################################
# Global Defines
DEFINE_COMMA	:= ,

############################################
# Compilation Targets

# Programs
AS		:= arm-altera-eabi-as
CC		:= arm-altera-eabi-gcc
LD		:= arm-altera-eabi-ld
OC		:= arm-altera-eabi-objcopy
RM		:= rm -f

# Flags
USERCCFLAGS	:= 
ARCHASFLAGS	:= -mfloat-abi=soft -march=armv7-a -mcpu=cortex-a9 --gstabs -I "$$GNU_ARM_TOOL_ROOTDIR/arm-altera-eabi/include/"
ARCHCCFLAGS	:= -mfloat-abi=soft -march=armv7-a -mtune=cortex-a9 -mcpu=cortex-a9
ARCHLDFLAGS	:=
ARCHLDSCRIPT	:=
ASFLAGS		:= $(ARCHASFLAGS)
CCFLAGS		:= -Wall -c $(USERCCFLAGS) $(ARCHCCFLAGS)
LDFLAGS		:= $(ARCHLDFLAGS) $(ARCHLDSCRIPT)
OCFLAGS		:= -O srec

# Files
HDRS		:=
SRCS		:= video_in.axf
OBJS		:= $(patsubst %, %.o, $(SRCS))

# Targets
compile: video_in.srec

video_in.srec: video_in.axf
	$(RM) $@
	$(OC) $(OCFLAGS) $< $@

