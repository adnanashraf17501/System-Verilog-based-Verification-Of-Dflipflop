`ifndef _tx_
`define _tx_
`include "dff_base.sv"

class tx_gen;
base_pkt pkt;
mailbox tx2drv;
function new(base_pkt pkt,mailbox tx2drv);
this.pkt=pkt;
this.tx2drv=tx2drv;
endfunction
task tx_run();
begin
pkt.randomize();
tx2drv.put(pkt);
end
endtask
endclass

`endif

