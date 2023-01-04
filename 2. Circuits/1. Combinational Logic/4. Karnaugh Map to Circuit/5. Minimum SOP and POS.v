module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    // SOP
    or(out_sop, !a&!b&c, c&d);
    // POS
    and(out_pos, c, !b|d, !a|b);    

endmodule
