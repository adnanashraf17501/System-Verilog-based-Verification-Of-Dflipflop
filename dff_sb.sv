`include "dff_base.sv"

class scoreboard;
base_pkt pkt1,pkt2;
mailbox drv2sb,mon2sb;


function new(base_pkt pkt1,pkt2,mailbox drv2sb,mon2sb);
this.pkt1=pkt1;
this.pkt2=pkt2;
this.drv2sb=drv2sb;
this.mon2sb=mon2sb;
endfunction
task sb_run();
begin
while(mon2sb.num()!=0)
mon2sb.get(pkt2);
drv2sb.get(pkt1);
#10
begin
if(pkt2.Q==pkt1.Din)
$display($time,"matched pkt2.Q=%b pkt1.Din=%b",pkt2.Q,pkt1.Din);
else
$display($time,"notmatched pkt2.Q=%b pkt1.Din=%b",pkt2.Q,pkt1.Din);
end
end
endtask
endclass
