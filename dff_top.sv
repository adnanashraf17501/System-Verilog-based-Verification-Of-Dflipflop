`include "dff_interface.sv"
`include "dff_dut.sv"
`include "dff_tb.sv"
`include "dff_assert.sv"
module dff_top11();
bit clk;
always
#5 clk=~clk;
dff_if infc(clk);
dff_dut dut(infc);
dff_tb tb(infc);
dff_assert t1(infc);
endmodule
