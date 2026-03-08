//===================================
// BlinkLED : FPGA Top
//     2025.12.24 Munetomo Maruyama
//===================================

//----------------------------------------------------------------------
// !!! Very Important Notice !!!
//----------------------------------------------------------------------
// Workaround for Altera MAX 10 Errata.
// If you encounter this errata, you may be PERMANENTLY unable to 
// reconfigure your DIP_FPGA.
//----------------------------------------------------------------------
// (1) Enable "JTAG pin sharing".
//     Go to: "Assignments"
//     --> Menu "Device..."
//     --> Tab "Device"
//     --> Button "Device and Pin Options..."
//     --> Category "General"
//     --> Check "Enable JTAG pin sharing"
//
// (2) You MUST assign user pins shared by JTAG as follows:
//     C1 (TDI): Always assign as User In/Out/Inout Pin. Do not leave unassigned.
//     C3 (TMS): Always assign as User In/Out/Inout Pin. Do not leave unassigned.
//     D3 (TCK): Always assign as User In/Out/Inout Pin. Do not leave unassigned.
//     D2 (TDO): Always assign as User Output Pin and drive LO or HI. (CAUTION!)
//               DO NOT assign as In/Inout. Do not leave unassigned.
//
// (3) Best Practice: To detect potential issues before locking the device.
//     First, try configuring the FPGA using the .sof file.
//     If no errors occur, then configure the FLASH memory using the .pof file.
//----------------------------------------------------------------------

//-------------------
// Top Module
//-------------------
module FPGA
(
    // Pins shared by JTAG
    output logic LED,    // C1 (TDI), do not leave unassigned.
    input  logic DUMMY1, // C3 (TMS), do not leave unassigned.
    inout  logic DUMMY2, // D3 (TCK), do not leave unassigned.
    output logic DUMMY3  // D2 (TDO), do output LO or HI.
);

//----------------------
// Pins shared by JTAG
//----------------------
logic __unused;
assign __unused = DUMMY1 & DUMMY2;
assign DUMMY2 = 1'bz;
assign DUMMY3 = 1'b0; // shared by TDO 

//----------------------
// Internal Oscillator
//----------------------
logic oscena;
logic clk;
//
assign oscena = 1'b1;
//
OSC U_OSC
(
    .oscena (oscena),
    .clkout (clk)      // 55MHz
);

//--------------------------
// Internal Power on Reset
//--------------------------
//
// period of power on reset 
`ifdef SIMULATION
    `define POR_MAX 16'h000f
`else  // Real FPGA
    `define POR_MAX 16'hffff 
`endif
//
logic        por_n;     // should be power-up level = Low
logic [15:0] por_count; // should be power-up level = Low
//
always @(posedge clk)
begin
    if (por_count != `POR_MAX)
    begin
        por_n <= 1'b0;
        por_count <= por_count + 16'h0001;
    end
    else
    begin
        por_n <= 1'b1;
        por_count <= por_count;
    end
end
//
logic res; // System Reset in FPGA
assign res = ~por_n;

//--------------------------------
// LED Blink Interval Counter
//--------------------------------
// Interval of LED ON/OFF
`ifdef SIMULATION
    `define LED_MAX ((32'd256/2)-32'd1)
`else  // Real FPGA
    `define LED_MAX ((32'd55000000/2)-32'd1)
`endif
//
logic [31:0] led_count;
logic        led_count_max;
//
always @(posedge clk, posedge res)
begin
    if (res)
        led_count <= 32'h00000000;
    else if (led_count_max)
        led_count <= 32'h00000000;
    else    
        led_count <= led_count + 32'h00000001;
end
//
assign led_count_max = (led_count == `LED_MAX);

//--------------------------------
// LED Toggle
//--------------------------------
always @(posedge clk, posedge res)
begin
    if (res)
        LED <= 1'b0;
    else if (led_count_max)
        LED <= ~LED;
end

endmodule
//===================================
// End of Module
//===================================
