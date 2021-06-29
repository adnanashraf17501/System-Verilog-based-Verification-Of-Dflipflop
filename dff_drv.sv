`include "dff_base.sv"
class driver;
base_pkt pkt;
mailbox tx2drv,drv2sb;
virtual dff_if infc;
function new(base_pkt pkt,mailbox tx2drv,drv2sb, virtual dff_if infc);
this.pkt=pkt;
this.tx2drv=tx2drv;
this.drv2sb=drv2sb;
this.infc=infc;
endfunction
task drv_run();
begin
tx2drv.get(pkt);
infc.rst=1;
infc.Din=pkt.Din;
drv2sb.put(pkt);
end
endtask
endclass