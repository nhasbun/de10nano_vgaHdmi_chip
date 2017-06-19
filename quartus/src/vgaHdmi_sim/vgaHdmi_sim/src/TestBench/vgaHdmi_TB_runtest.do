SetActiveLib -work
#Compiling UUT module design files
comp -include "$dsn\..\..\vgaHdmi.v"
comp -include "$dsn\src\TestBench\vgaHdmi_TB.v"
asim +access +r vgaHdmi_tb

add wave -noreg -logic {/vgaHdmi_tb/clock}
add wave -noreg -logic {/vgaHdmi_tb/clock50}
add wave -noreg -logic {/vgaHdmi_tb/reset}
add wave -noreg -color 255,4,255 -logic {/vgaHdmi_tb/hsync}
add wave -noreg -color 255,4,255 -logic {/vgaHdmi_tb/vsync}
add wave -noreg -color 255,255,0 -decimal -literal {/vgaHdmi_tb/UUT/pixelH}
add wave -noreg -color 255,255,0 -decimal -literal {/vgaHdmi_tb/UUT/pixelV}
add wave -noreg -logic {/vgaHdmi_tb/dataEnable}
add wave -noreg -logic {/vgaHdmi_tb/vgaClock}
add wave -noreg -decimal -literal {/vgaHdmi_tb/RGBchannel}

run 10000.00 us

#End simulation macro
