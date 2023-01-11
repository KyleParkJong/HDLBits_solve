module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    digit dig0 (.clk(clk), .reset(reset), .ena(1),      .q(q[3:0]));
    digit dig1 (.clk(clk), .reset(reset), .ena(ena[1]), .q(q[7:4]));
    digit dig2 (.clk(clk), .reset(reset), .ena(ena[2]), .q(q[11:8]));
    digit dig3 (.clk(clk), .reset(reset), .ena(ena[3]), .q(q[15:12]));

    assign ena[1] = (q[3:0]==9); 
    assign ena[2] = (q[3:0]==9&&q[7:4]==9); 
    assign ena[3] = (q[3:0]==9&&q[7:4]==9&&q[11:8]==9); 

endmodule

module digit (
    input clk, reset, ena,
    output [3:0] q
);

    always @(posedge clk) begin
        if (reset )
            q <= 0;
        else if (ena)
            if (q==9)
                q <= 0;
            else
                q <= q + 1;
        else
            q <= q;
    end

endmodule
