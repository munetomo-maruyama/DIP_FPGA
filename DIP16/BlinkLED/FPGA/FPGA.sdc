create_clock -name CLK -period 18 [get_pins {U_OSC|int_osc_0|oscillator_dut|clkout}]
set_output_delay -clock { CLK } 5 [get_ports {LED}]

set_false_path -through [get_ports {DUMMY1 DUMMY2 DUMMY3}]
