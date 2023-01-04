module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    assign sum = x + y;
    // 3bit + 3bit = 4bit

endmodule