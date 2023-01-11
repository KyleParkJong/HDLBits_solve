module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always @(posedge clk, posedge areset) begin
        if (areset)
            q <= 0;
        else if (load)
            q <= data;
        else if (ena)           
            q <= q >> 1;
            // q <= {1'b1, q[3:1]}; 
            /*  
                else 없어도 된다.
                else가 없으면 자동으로 latch가 생기는데, 
                이 latch는 이전 값을 유지하는 (hold) 역할을 하기에, 
                우리가 원하는 역할이다.
            */
    end

endmodule