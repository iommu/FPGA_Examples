set projDir "/home/iommu/Desktop/FPGA/binary_counter/work/vivado"
set projName "binary_counter"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/iommu/Desktop/FPGA/binary_counter/work/verilog/au_top_0.v" "/home/iommu/Desktop/FPGA/binary_counter/work/verilog/reset_conditioner_1.v" "/home/iommu/Desktop/FPGA/binary_counter/work/verilog/binary_counter_2.v" "/home/iommu/Desktop/FPGA/binary_counter/work/verilog/counter_3.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/iommu/Desktop/FPGA/binary_counter/work/constraint/alchitry.xdc" "/usr/share/alchitry-labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
