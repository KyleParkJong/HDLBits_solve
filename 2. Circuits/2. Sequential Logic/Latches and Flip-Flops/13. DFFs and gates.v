module top_module (
    input clk,
    input x,
    output z
); 

    reg q1, q2, q3;
    wire w1, w2, w3;

    always @(posedge clk) begin
        q1 <= w1;
        q2 <= w2;
        q3 <= w3;
    end

    assign w1 = x ^ q1;
    assign w2 = x & !q2;
    assign w3 = x | !q3;
    assign z = !(q1 | q2 | q3);


endmodule
