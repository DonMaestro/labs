# Created by the Intel FPGA Monitor Program
# DO NOT MODIFY

############################################
# Global Macros

DEFINE_COMMA			:= ,

############################################
# Compilation Macros

# Programs
AS		:= arm-altera-eabi-as
CC		:= arm-altera-eabi-gcc
LD		:= arm-altera-eabi-ld
OC		:= arm-altera-eabi-objcopy
RM		:= rm -f

# Flags
USERCCFLAGS	:= -g -O1
USERLDFLAGS	:= 
ARCHASFLAGS	:= -mfloat-abi=soft -march=armv7-a -mcpu=cortex-a9 --gstabs -I "$$GNU_ARM_TOOL_ROOTDIR/arm-altera-eabi/include/"
ARCHCCFLAGS	:= -mfloat-abi=soft -march=armv7-a -mtune=cortex-a9 -mcpu=cortex-a9
ARCHLDFLAGS	:= --defsym arm_program_mem=0x0 --defsym arm_available_mem_size=0x3ffffff8 --defsym __cs3_stack=0x3ffffff8
ARCHLDSCRIPT	:= -T"/opt/intelFPGA/21.1/University_Program/Monitor_Program/build/altera-socfpga-hosted.ld"
ASFLAGS		:= $(ARCHASFLAGS)
CCFLAGS		:= -Wall -c $(USERCCFLAGS) $(ARCHCCFLAGS)
LDFLAGS		:= $(patsubst %, -Wl$(DEFINE_COMMA)%, $(ARCHLDFLAGS)) $(ARCHLDSCRIPT) $(USERLDFLAGS)
OCFLAGS		:= -O srec

# Files
HDRS		:=
SRCS		:= video_in.c
OBJS		:= $(patsubst %, %.o, $(SRCS))

############################################
# GDB Macros

############################################
# System Macros

# Programs
SYS_PROG_QP_PROGRAMMER	:= quartus_pgm
SYS_PROG_QP_HPS			:= quartus_hps
SYS_PROG_SYSTEM_CONSOLE	:= system-console
SYS_PROG_NII_GDB_SERVER	:= nios2-gdb-server

# Flags
SYS_FLAG_CABLE			:= -c "null"
SYS_FLAG_USB			:= "null"
SYS_FLAG_JTAG_INST		:= --instance
SYS_FLAG_NII_HALT		:= --stop

# Files
SYS_FILE_SOF			:= "/home/maestro/Documents/KPI/mag1/SOC/lab6/verilog/DE1_SoC_Computer.sof"
SYS_SCRIPT_JTAG_ID		:= --script="/opt/intelFPGA/21.1/University_Program/Monitor_Program/bin/jtag_instance_check.tcl"
SYS_FILE_ARM_PL			:= --preloader "/opt/intelFPGA/21.1/University_Program/Monitor_Program/arm_tools/u-boot-spl.de1-soc.srec"
SYS_FLAG_ARM_PL_ADDR	:= --preloaderaddr 0xffff13a0

############################################
# Compilation Targets

COMPILE: video_in.srec

video_in.srec: video_in.axf
	$(RM) $@
	$(OC) $(OCFLAGS) $< $@

video_in.axf: $(OBJS)
	$(RM) $@
	$(CC) $(OBJS) $(LDFLAGS) -o $@

%.c.o: %.c $(HDRS)
	$(RM) $@
	$(CC) $(CCFLAGS) $< -o $@

%.s.o: %.s $(HDRS)
	$(RM) $@
	$(AS) $(ASFLAGS) $< -o $@

CLEAN: 
	$(RM) video_in.srec video_in.axf $(OBJS)

############################################
# System Targets

DETECT_DEVICES:
	$(SYS_PROG_QP_PROGRAMMER) $(SYS_FLAG_CABLE) --auto

ARM_RUN_PRELOADER:
	$(SYS_PROG_QP_HPS) $(SYS_FLAG_CABLE) -o GDBSERVER -gdbport0 $(SYS_ARG_GDB_PORT) $(SYS_FILE_ARM_PL) $(SYS_FLAG_ARM_PL_ADDR) 

DOWNLOAD_SYSTEM:
	$(SYS_PROG_QP_PROGRAMMER) $(SYS_FLAG_CABLE) -m jtag -o P\;$(SYS_FILE_SOF)@$(SYS_ARG_JTAG_INDEX) 

CHECK_JTAG_ID:
	$(SYS_PROG_SYSTEM_CONSOLE) $(SYS_SCRIPT_JTAG_ID) $(SYS_FLAG_USB) $(SYS_FILE_SOF) 

HALT_NII:
	$(SYS_PROG_NII_GDB_SERVER) $(SYS_FLAG_CABLE) $(SYS_FLAG_JTAG_INST) $(SYS_ARG_JTAG_INDEX) $(SYS_FLAG_NII_HALT) 

