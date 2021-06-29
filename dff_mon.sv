`include "dff_base.sv"
class monitor;
base_pkt pkt;
mailbox mon2sb;
virtual dff_if infc;
function new(base_pkt pkt,mailbox mon2sb, virtual dff_if infc);
this.pkt=pkt;
this.mon2sb=mon2sb;
this.infc=infc;
endfunction
task mon_run();
begin
@(infc.cb)
pkt.Q=infc.Q;
mon2sb.put(pkt);
end
endtask
endclass