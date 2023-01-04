module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);
    wire [7:0] tmp1, tmp2;

    assign tmp1 = a > b ? b : a;
    assign tmp2 = c > d ? d : c;

    assign min = tmp1 > tmp2 ? tmp2 : tmp1;
endmodule