/**
Descripcion,
Modulo top que envia las senales de comunicacion generadas por vga al chip
HDMI ADV7513, entregandole un reloj de 25MHz.

Este chip para comenzar debe iniciar una rutina de configuracion via i2c,
para mas informacion revisar el datasheet.

-----------------------------------------------------------------------------
Author : Nicolas Hasbun, nhasbun@gmail.com
File   : topModule.v
Create : 2017-06-15 23:21:31
Editor : sublime text3, tab size (2)
-----------------------------------------------------------------------------
*/

`include "vgaHdmi.v"
`include "i2c/I2C_HDMI_Config.v"

module TopModule(
  // **input**
  input clock50, reset_n,
  input HDMI_TX_INT,
  input switchR, switchG, switchB,
  
  // **inout**
  inout I2C_SDAT,
  
  // **output**
  output hsync, vsync,
  output dataEnable,
  output vgaClock,
  output [23:0] RGBchannel,
  output I2C_SCLK, READY
  );

wire clock25, locked;
wire reset;
assign reset = ~reset_n; //
// reset de placa presionado funciona con logica negativa

// **VGA CLOCK**
pll_25 pll_25(
  .refclk(clock50),
  .rst(reset),

  .outclk_0(clock25),
  .locked(locked)
  );

// **VGA MAIN CONTROLLER**
vgaHdmi vgaHdmi (
  // input
  .clock      (clock25),
  .clock50    (clock50),
  .reset      (~locked),
  .hsync      (hsync),
  .vsync      (vsync),
  .switchR    (switchR),
  .switchG    (switchG),
  .switchB    (switchB),

  // output
  .dataEnable (dataEnable),
  .vgaClock   (vgaClock),
  .RGBchannel (RGBchannel)
);

// **I2C Interface for ADV7513 initial config**
I2C_HDMI_Config #(
  .CLK_Freq (50000000), // trabajamos con reloj de 50MHz
  .I2C_Freq (20000)    // reloj de 20kHz for i2c clock
  )
  
  I2C_HDMI_Config (
  .iCLK        (clock50),
  .iRST_N      (reset_n),
  .I2C_SCLK    (I2C_SCLK),
  .I2C_SDAT    (I2C_SDAT),
  .HDMI_TX_INT (HDMI_TX_INT),
  .READY       (READY)
);

endmodule