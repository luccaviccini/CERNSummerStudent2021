onerror {resume}
quietly WaveActivateNextPane {} 0

 if {[runStatus] != "nodesign"} {
  if {[find instances -bydu -nodu "init_ram_2008_tb"] == "/init_ram_2008_tb"} {
    add wave -noupdate /init_ram_2008_tb/ram_hex
    add wave -noupdate /init_ram_2008_tb/ram_bin
  } elseif {[find instances -bydu -nodu "init_ram_legacy_tb"] == "/init_ram_legacy_tb"} {
    add wave -noupdate /init_ram_legacy_tb/ram_hex
    add wave -noupdate /init_ram_legacy_tb/ram_bin
  }   
}

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {41 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {105 ns}
