# Created by the Intel FPGA Monitor Program
# DO NOT MODIFY

############################################
# Global Macros

DEFINE_COMMA			:= ,

############################################
# Compilation Macros

# Programs
AS		:= nios2-elf-as
CC		:= nios2-elf-gcc
LD		:= nios2-elf-ld
OC		:= nios2-elf-objcopy
RM		:= rm -f

# Flags
USERCCFLAGS	:= -g -O1 -ffunction-sections -fverbose-asm -fno-inline -mno-cache-volatile
USERLDFLAGS	:= -L /opt/intelFPGA/21.1/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/lib/gcc/nios2-elf/11.2.1/ -l:libgcc.a
ARCHASFLAGS	:= --gstabs -I "/opt/intelFPGA/21.1/nios2eds/components/altera_nios2/sdk/inc/"
ARCHCCFLAGS	:= -mno-hw-mul -mno-hw-div -I "/opt/intelFPGA/21.1/nios2eds/components/altera_nios2/HAL/inc/" -DSYSTEM_BUS_WIDTH=32 -DALT_SINGLE_THREADED -D_JTAG_UART_BASE=8224u
ARCHLDFLAGS	:= --defsym nasys_stack_top=0x1000 --defsym nasys_program_mem=0x0 --defsym nasys_data_mem=0x0
ARCHLDSCRIPT	:= --script="/opt/intelFPGA/21.1/University_Program/Monitor_Program/build/nios_as_build.ld"
ASFLAGS		:= $(ARCHASFLAGS)
CCFLAGS		:= -Wall -c $(USERCCFLAGS) $(ARCHCCFLAGS)
LDFLAGS		:= $(ARCHLDFLAGS) $(ARCHLDSCRIPT) -e _start -u _start $(USERLDFLAGS)
OCFLAGS		:= -O srec

# Files
HDRS		:=
SRCS		:= sum_2vec.s
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
SYS_FILE_SOF			:= "/home/maestro/Documents/KPI/mag1/SOC/lab1/output_files/lab.sof"
SYS_SCRIPT_JTAG_ID		:= --script="/opt/intelFPGA/21.1/University_Program/Monitor_Program/bin/jtag_instance_check.tcl"
SYS_FILE_ARM_PL			:= --preloader ""
SYS_FLAG_ARM_PL_ADDR	:= --preloaderaddr null

############################################
# Compilation Targets

COMPILE: sum_2vec.srec

sum_2vec.srec: sum_2vec.elf
	$(RM) $@
	$(OC) $(OCFLAGS) $< $@

sum_2vec.elf: $(OBJS)
	$(RM) $@
	$(LD) $(OBJS) $(LDFLAGS) -o $@

%.c.o: %.c $(HDRS)
	$(RM) $@
	$(CC) $(CCFLAGS) $< -o $@

%.s.o: %.s $(HDRS)
	$(RM) $@
	$(AS) $(ASFLAGS) $< -o $@

CLEAN: 
	$(RM) sum_2vec.srec sum_2vec.elf $(OBJS)

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

