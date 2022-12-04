

module comp_arm (
	////////////////////////////////////
	// FPGA Pins
	////////////////////////////////////

	// Clock pins
	CLOCK_50,

	// SDRAM
//	DRAM_ADDR,
//	DRAM_BA,
//	DRAM_CAS_N,
//	DRAM_CKE,
	DRAM_CLK,
//	DRAM_CS_N,
//	DRAM_DQ,
//	DRAM_LDQM,
//	DRAM_RAS_N,
//	DRAM_UDQM,
//	DRAM_WE_N,
	
	// Seven Segment Displays
	HEX0,
	HEX1,
//	HEX2,
//	HEX3,
//	HEX4,
//	HEX5,

	// LEDs
	LEDR,

	// Slider Switches
	SW,

	////////////////////////////////////
	// HPS Pins
	////////////////////////////////////
	
	// DDR3 SDRAM
	HPS_DDR3_ADDR,
	HPS_DDR3_BA,
	HPS_DDR3_CAS_N,
	HPS_DDR3_CKE,
	HPS_DDR3_CK_N,
	HPS_DDR3_CK_P,
	HPS_DDR3_CS_N,
	HPS_DDR3_DM,
	HPS_DDR3_DQ,
	HPS_DDR3_DQS_N,
	HPS_DDR3_DQS_P,
	HPS_DDR3_ODT,
	HPS_DDR3_RAS_N,
	HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ,
	HPS_DDR3_WE_N,

	// Ethernet
	HPS_ENET_GTX_CLK,
	HPS_ENET_INT_N,
	HPS_ENET_MDC,
	HPS_ENET_MDIO,
	HPS_ENET_RX_CLK,
	HPS_ENET_RX_DATA,
	HPS_ENET_RX_DV,
	HPS_ENET_TX_DATA,
	HPS_ENET_TX_EN,

	// Flash
	HPS_FLASH_DATA,
	HPS_FLASH_DCLK,
	HPS_FLASH_NCSO,

	// Accelerometer
	HPS_GSENSOR_INT,
		
	// General Purpose I/O
	HPS_GPIO,
		
	// I2C
	HPS_I2C_CONTROL,
	HPS_I2C1_SCLK,
	HPS_I2C1_SDAT,
	HPS_I2C2_SCLK,
	HPS_I2C2_SDAT,

	// Pushbutton
	HPS_KEY,

	// LED
	HPS_LED,
		
	// SD Card
	HPS_SD_CLK,
	HPS_SD_CMD,
	HPS_SD_DATA,

	// SPI
	HPS_SPIM_CLK,
	HPS_SPIM_MISO,
	HPS_SPIM_MOSI,
	HPS_SPIM_SS,

	// UART
	HPS_UART_RX,
	HPS_UART_TX,

	// USB
	HPS_CONV_USB_N,
	HPS_USB_CLKOUT,
	HPS_USB_DATA,
	HPS_USB_DIR,
	HPS_USB_NXT,
	HPS_USB_STP
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

////////////////////////////////////
// FPGA Pins
////////////////////////////////////

// Clock pins
input						CLOCK_50;

// SDRAM
//output 		[12: 0]	DRAM_ADDR;
//output		[ 1: 0]	DRAM_BA;
//output					DRAM_CAS_N;
//output					DRAM_CKE;
output					DRAM_CLK;
//output					DRAM_CS_N;
//inout			[15: 0]	DRAM_DQ;
//output					DRAM_LDQM;
//output					DRAM_RAS_N;
//output					DRAM_UDQM;
//output					DRAM_WE_N;

// Seven Segment Displays
output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
//output		[ 6: 0]	HEX2;
//output		[ 6: 0]	HEX3;
//output		[ 6: 0]	HEX4;
//output		[ 6: 0]	HEX5;

// LEDs
output		[ 9: 0]	LEDR;

// Slider Switches
input			[ 9: 0]	SW;

////////////////////////////////////
// HPS Pins
////////////////////////////////////
	
// DDR3 SDRAM
output		[14: 0]	HPS_DDR3_ADDR;
output		[ 2: 0]  HPS_DDR3_BA;
output					HPS_DDR3_CAS_N;
output					HPS_DDR3_CKE;
output					HPS_DDR3_CK_N;
output					HPS_DDR3_CK_P;
output					HPS_DDR3_CS_N;
output		[ 3: 0]	HPS_DDR3_DM;
inout			[31: 0]	HPS_DDR3_DQ;
inout			[ 3: 0]	HPS_DDR3_DQS_N;
inout			[ 3: 0]	HPS_DDR3_DQS_P;
output					HPS_DDR3_ODT;
output					HPS_DDR3_RAS_N;
output					HPS_DDR3_RESET_N;
input						HPS_DDR3_RZQ;
output					HPS_DDR3_WE_N;

// Ethernet
output					HPS_ENET_GTX_CLK;
inout						HPS_ENET_INT_N;
output					HPS_ENET_MDC;
inout						HPS_ENET_MDIO;
input						HPS_ENET_RX_CLK;
input			[ 3: 0]	HPS_ENET_RX_DATA;
input						HPS_ENET_RX_DV;
output		[ 3: 0]	HPS_ENET_TX_DATA;
output					HPS_ENET_TX_EN;

// Flash
inout			[ 3: 0]	HPS_FLASH_DATA;
output					HPS_FLASH_DCLK;
output					HPS_FLASH_NCSO;

// Accelerometer
inout						HPS_GSENSOR_INT;

// General Purpose I/O
inout			[ 1: 0]	HPS_GPIO;

// I2C
inout						HPS_I2C_CONTROL;
inout						HPS_I2C1_SCLK;
inout						HPS_I2C1_SDAT;
inout						HPS_I2C2_SCLK;
inout						HPS_I2C2_SDAT;

// Pushbutton
inout						HPS_KEY;

// LED
inout						HPS_LED;

// SD Card
output					HPS_SD_CLK;
inout						HPS_SD_CMD;
inout			[ 3: 0]	HPS_SD_DATA;

// SPI
output					HPS_SPIM_CLK;
input						HPS_SPIM_MISO;
output					HPS_SPIM_MOSI;
inout						HPS_SPIM_SS;

// UART
input						HPS_UART_RX;
output					HPS_UART_TX;

// USB
inout						HPS_CONV_USB_N;
input						HPS_USB_CLKOUT;
inout			[ 7: 0]	HPS_USB_DATA;
input						HPS_USB_DIR;
input						HPS_USB_NXT;
output					HPS_USB_STP;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire	[6:0]	hex0;
wire	[6:0]	hex1;

assign HEX0 = hex0;
assign HEX1 = hex1;

hex7seg h7s_0 (LEDR[3:0], hex0);
hex7seg h7s_1 (LEDR[7:4], hex1);

//=======================================================
//  Structural coding
//=======================================================
       
Computer_System u0 (
        .hps_io_hps_io_emac1_inst_TX_CLK (HPS_ENET_GTX_CLK), //               hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   (HPS_ENET_TX_DATA[0]),   //                     .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   (HPS_ENET_TX_DATA[1]),   //                     .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   (HPS_ENET_TX_DATA[2]),   //                     .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   (HPS_ENET_TX_DATA[3]),   //                     .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   (HPS_ENET_RX_DATA[0]),   //                     .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   (HPS_ENET_MDIO),   //                     .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    (HPS_ENET_MDC),    //                     .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL (HPS_ENET_RX_DV), //                     .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL (HPS_ENET_TX_EN), //                     .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK (HPS_ENET_RX_CLK), //                     .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   (HPS_ENET_RX_DATA[1]),   //                     .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   (HPS_ENET_RX_DATA[2]),   //                     .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   (HPS_ENET_RX_DATA[3]),   //                     .hps_io_emac1_inst_RXD3
        .hps_io_hps_io_qspi_inst_IO0     (HPS_FLASH_DATA[0]),     //                     .hps_io_qspi_inst_IO0
        .hps_io_hps_io_qspi_inst_IO1     (HPS_FLASH_DATA[1]),     //                     .hps_io_qspi_inst_IO1
        .hps_io_hps_io_qspi_inst_IO2     (HPS_FLASH_DATA[2]),     //                     .hps_io_qspi_inst_IO2
        .hps_io_hps_io_qspi_inst_IO3     (HPS_FLASH_DATA[3]),     //                     .hps_io_qspi_inst_IO3
        .hps_io_hps_io_qspi_inst_SS0     (HPS_FLASH_NCSO),     //                     .hps_io_qspi_inst_SS0
        .hps_io_hps_io_qspi_inst_CLK     (HPS_FLASH_DCLK),     //                     .hps_io_qspi_inst_CLK
        .hps_io_hps_io_sdio_inst_CMD     (HPS_SD_CMD),     //                     .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      (HPS_SD_DATA[0]),      //                     .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      (HPS_SD_DATA[1]),      //                     .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     (HPS_SD_CLK),      //                     .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      (HPS_SD_DATA[2]),  //                     .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      (HPS_SD_DATA[3]),  //                     .hps_io_sdio_inst_D3
        .hps_io_hps_io_usb1_inst_D0      (HPS_USB_DATA[0]), //                     .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      (HPS_USB_DATA[1]), //                     .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      (HPS_USB_DATA[2]), //                     .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      (HPS_USB_DATA[3]), //                     .hps_io_usb1_inst_D3
       	.hps_io_hps_io_usb1_inst_D4      (HPS_USB_DATA[4]), //                     .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      (HPS_USB_DATA[5]), //                     .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      (HPS_USB_DATA[6]), //                     .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      (HPS_USB_DATA[7]), //                     .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     (HPS_USB_CLKOUT),  //                     .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     (HPS_USB_STP),     //                     .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     (HPS_USB_DIR),     //                     .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     (HPS_USB_NXT),     //                     .hps_io_usb1_inst_NXT
        .hps_io_hps_io_spim1_inst_CLK    (HPS_SPIM_CLK),    //                     .hps_io_spim1_inst_CLK
        .hps_io_hps_io_spim1_inst_MOSI   (HPS_SPIM_MOSI),   //                     .hps_io_spim1_inst_MOSI
        .hps_io_hps_io_spim1_inst_MISO   (HPS_SPIM_MISO),   //                     .hps_io_spim1_inst_MISO
        .hps_io_hps_io_spim1_inst_SS0    (HPS_SPIM_SS),    //                     .hps_io_spim1_inst_SS0
        .hps_io_hps_io_uart0_inst_RX     (HPS_UART_RX),     //                     .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     (HPS_UART_TX),     //                     .hps_io_uart0_inst_TX
        .hps_io_hps_io_i2c0_inst_SDA     (HPS_I2C1_SDAT),     //                     .hps_io_i2c0_inst_SDA
        .hps_io_hps_io_i2c0_inst_SCL     (HPS_I2C1_SCLK),     //                     .hps_io_i2c0_inst_SCL
        .hps_io_hps_io_i2c1_inst_SDA     (HPS_I2C2_SDAT),     //                     .hps_io_i2c1_inst_SDA
        .hps_io_hps_io_i2c1_inst_SCL     (HPS_I2C2_SCLK),     //                     .hps_io_i2c1_inst_SCL
	.hps_io_hps_io_gpio_inst_GPIO09  (HPS_CONV_USB_N),   //                     .hps_io_gpio_inst_GPIO09
        .hps_io_hps_io_gpio_inst_GPIO35  (HPS_ENET_INT_N),   //                     .hps_io_gpio_inst_GPIO35
        .hps_io_hps_io_gpio_inst_GPIO40  (HPS_GPIO[0]),      //                     .hps_io_gpio_inst_GPIO40
        .hps_io_hps_io_gpio_inst_GPIO41  (HPS_GPIO[1]),      //                     .hps_io_gpio_inst_GPIO41
        .hps_io_hps_io_gpio_inst_GPIO48  (HPS_I2C_CONTROL),  //                     .hps_io_gpio_inst_GPIO48
        .hps_io_hps_io_gpio_inst_GPIO53  (HPS_LED),          //                     .hps_io_gpio_inst_GPIO53
        .hps_io_hps_io_gpio_inst_GPIO54  (HPS_KEY),          //                     .hps_io_gpio_inst_GPIO54
        .hps_io_hps_io_gpio_inst_GPIO61  (HPS_GSENSOR_INT),  //                     .hps_io_gpio_inst_GPIO61
        .leds_export                     (LEDR),             //                 leds.export
        .memory_mem_a                    (HPS_DDR3_ADDR),    //               memory.mem_a
        .memory_mem_ba                   (HPS_DDR3_BA),      //                     .mem_ba
        .memory_mem_ck                   (HPS_DDR3_CK_P),    //                     .mem_ck
        .memory_mem_ck_n                 (HPS_DDR3_CK_N),    //                     .mem_ck_n
        .memory_mem_cke                  (HPS_DDR3_CKE),     //                     .mem_cke
        .memory_mem_cs_n                 (HPS_DDR3_CS_N),    //                     .mem_cs_n
        .memory_mem_ras_n                (HPS_DDR3_RAS_N),   //                     .mem_ras_n
        .memory_mem_cas_n                (HPS_DDR3_CAS_N),   //                     .mem_cas_n
        .memory_mem_we_n                 (HPS_DDR3_WE_N),    //                     .mem_we_n
        .memory_mem_reset_n              (HPS_DDR3_RESET_N), //                     .mem_reset_n
        .memory_mem_dq                   (HPS_DDR3_DQ),      //                     .mem_dq
        .memory_mem_dqs                  (HPS_DDR3_DQS_P),   //                     .mem_dqs
        .memory_mem_dqs_n                (HPS_DDR3_DQS_N),   //                     .mem_dqs_n
        .memory_mem_odt                  (HPS_DDR3_ODT),     //                     .mem_odt
        .memory_mem_dm                   (HPS_DDR3_DM),      //                     .mem_dm
        .memory_oct_rzqin                (HPS_DDR3_RZQ),     //                     .oct_rzqin
        .sdram_clk_clk                   (DRAM_CLK),         //            sdram_clk.clk
        .slider_switches_export          (SW),               //      slider_switches.export
        .system_pll_ref_clk_clk          (CLOCK_50),         //   system_pll_ref_clk.clk
        .system_pll_ref_reset_reset      (1'b0)              // system_pll_ref_reset.reset
);




endmodule
