module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 

    assign s = a + b;
    assign overflow = (~a[7] & ~b[7] & s[7]) | (a[7] & b[7] & ~s[7]);
    // overflow : (pos) + (pos) = (neg)
    //            (neg) + (neg) = (pos)
    // Truth table -> overflow = a'b's + abs'

endmodule

// To prevent overflow, extend the input to 9bits with sign extension
// a_extended = {a[7], a}
// b_extended = {b[7], a}