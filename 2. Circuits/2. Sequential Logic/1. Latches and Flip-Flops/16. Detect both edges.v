module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    reg [7:0] in_delay;
    integer i;

    // 1 cylce delay
    always @(posedge clk) begin
        in_delay <= in;
    end

    always @(posedge clk) begin
        for (i=0; i<8 ; i=i+1) begin
            anyedge[i] <= in_delay[i] ^ in[i] ? 1 : 0;
        end
    end
endmodule