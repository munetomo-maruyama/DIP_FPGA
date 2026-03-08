//===================================
// BlinkLED : Testbench
//     2025.12.24 Munetomo Maruyama
//===================================
`timescale 1ns/100ps
//
`define TB_TCYC_CLK    18 //ns (55MHz)
`define TB_RESET_WIDTH 100 //ns
`define TB_STOP 1000

//------------------------
// Top of Testbench
//------------------------
module tb_TOP;

//-------------------------------
// Clock and Reset in the FPGA
//-------------------------------
//
// Initialize Internal Power on Reset
initial
begin
    U_TOP.por_count = 0;
    U_TOP.por_n = 0;
end
//
logic tb_clk;
logic tb_res;
//
assign tb_clk = U_TOP.clk;
assign tb_res = U_TOP.res;

//----------------------------
// Simulation Cycle Counter
//----------------------------
reg [31:0] tb_cyc;
//
always @(posedge tb_clk, posedge tb_res)
begin
    if (tb_res)
    
        tb_cyc <= 32'h0;
    else
        tb_cyc <= tb_cyc + 32'h1;
end
//
always @*
begin
    if (tb_cyc == `TB_STOP)
    begin
        $display("***** SIMULATION TIMEOUT ***** at %d", tb_cyc);
        $stop;
    end
end

//--------------------------
// Device Under Test
//--------------------------
logic led;
//
FPGA U_TOP
(
    .LED (led)
);

//------------------------
// End of Module
//------------------------
endmodule

//===========================================================
// End of File
//===========================================================
