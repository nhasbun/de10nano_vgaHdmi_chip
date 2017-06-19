# ADV7513 HDMI Transmitter #

This is a test for the **ADV7513** chip from Analog Devices which is pretty useful to make an easy compatible **HDMI 1.4** output starting with a common **VGA module**.

It is tested on a **de10 nano** board which has the chip included. **Quartus Prime 17** project is included for an easy deploy of a first working video signal. The project includes:

- Verilog HDL files
- SDC TimeQuest files por timing analysis
- Quartus Project files (pin assignment done, etc.)

There is a folder included under **./src/** with simulations done on **Active HDL 9.1** for functional verification of vga module and sync signals.

## I2C Controller ##

The chip needs to be configured via i2c on **every start** to start working. I re-used Verilog code included in some Terasic examples for this board to accomplish this.

I found this to be the only tricky part for an smooth vga to hdmi implementation. 