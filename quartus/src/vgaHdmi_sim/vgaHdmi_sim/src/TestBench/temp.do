onerror { resume }
transcript off
add wave -noreg -logic {/vgaHdmi_tb/clock}
add wave -noreg -logic {/vgaHdmi_tb/clock50}
add wave -noreg -logic {/vgaHdmi_tb/reset}
add wave -noreg -color 255,4,255 -logic {/vgaHdmi_tb/hsync}
add wave -noreg -color 255,4,255 -logic {/vgaHdmi_tb/vsync}
add wave -noreg -color 255,4,255 -logic {/vgaHdmi_tb/UUT/vsync_old}
add wave -noreg -color 255,158,0 -logic {/vgaHdmi_tb/UUT/newFrame}
add wave -noreg -color 255,255,0 -decimal -literal {/vgaHdmi_tb/UUT/pixelH}
add wave -noreg -color 255,255,0 -decimal -literal {/vgaHdmi_tb/UUT/pixelV}
add wave -noreg -logic {/vgaHdmi_tb/dataEnable}
add wave -noreg -logic {/vgaHdmi_tb/vgaClock}
add wave -noreg -decimal -literal {/vgaHdmi_tb/RGBchannel}
add wave -noreg -color 255,128,0 -decimal -literal -signed2 {/vgaHdmi_tb/UUT/contador}
cursor "Cursor 1" 7840.05us  
transcript on
