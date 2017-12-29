connect -url tcp:127.0.0.1:3121
source D:/ADS/SoC_intr_cache_V2/SoC_intr_cache_V2.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203823914A"} -index 0
loadhw -hw D:/ADS/SoC_intr_cache_V2/SoC_intr_cache_V2.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203823914A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-SMT1 210203823914A"} -index 1
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-SMT1 210203823914A"} -index 1
dow D:/ADS/SoC_intr_cache_V2/SoC_intr_cache_V2.sdk/test_ip/Debug/test_ip.elf
configparams force-mem-access 0
bpadd -addr &main
