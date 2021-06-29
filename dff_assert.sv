module dff_assert(dff_if inf);


sequence seq1;
(!inf.Din)##1(!inf.Q);
endsequence


sequence seq2;
(inf.Din)##1(inf.Q);
endsequence




property check_q;
@(posedge inf.clk)
disable iff(!inf.rst)   // if disableiff exp true logic disabled
inf.rst|->(seq1 or seq2);
endproperty
l2:assert property(check_q);

endmodule








