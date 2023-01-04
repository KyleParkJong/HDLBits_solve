module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (!a & !d) | (!b & !c) | (a & c & d) | (!a & b & c);    // SOP


endmodule

/* POS */
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    wire tmp1, tmp2, tmp3, tmp4;

    or(tmp1, !a, !c, d);
    or(tmp2, !a, !b, c);
    or(tmp3, !b, c, !d);
    or(tmp4, a, b, !c, !d);

    and(out, tmp1, tmp2, tmp3, tmp4);

endmodule