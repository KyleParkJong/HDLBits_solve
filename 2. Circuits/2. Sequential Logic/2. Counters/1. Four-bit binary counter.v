module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else    
            q <= q + 1;     // 어차피 4bit라 15까지밖에 못 센다.
    end

endmodule
