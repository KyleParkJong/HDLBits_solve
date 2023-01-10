module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

    reg [31:0] in_delay;
    integer i;

    // 1 clock cycle delay of input
    always @(posedge clk) begin
        in_delay <= in;
    end

    always @(posedge clk) begin
        if (reset != 0) begin
            out <= 0;
        end
        else begin
            for (i=0; i<32; i=i+1) begin
                out[i] <= in_delay[i]&!in[i] ? 1 : out[i];
            end
        end
    end

endmodule