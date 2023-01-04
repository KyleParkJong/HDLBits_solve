module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    or(out, a, !b&c);   // SOP

endmodule

/* POS */
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    and(out, a|!b, a|c);

endmodule

