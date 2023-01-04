module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    wire tmp1, tmp2, tmp3, tmp4;

    and(tmp1, a, b, c^d);
    and(tmp2, !a, c, b^~d);
    and(tmp3, !c, !d, a^b);
    and(tmp4, !b, d, a^~c);

    or(out, tmp1, tmp2, tmp3, tmp4);    

endmodule
