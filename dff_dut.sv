module dff_dut(dff_if.dut infc);
always@(posedge infc.clk)
begin
if(infc.rst==0)
infc.Q=0;
else
infc.Q=infc.Din;
end
endmodule
