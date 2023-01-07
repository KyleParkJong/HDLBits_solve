module top_module(
    input clk, L, r_in, q_in,
    output Q
);
    always @(posedge clk) begin
        case (L)
            1'b0 : Q <= q_in;
            1'b1 : Q <= r_in;
        endcase
    end
endmodule