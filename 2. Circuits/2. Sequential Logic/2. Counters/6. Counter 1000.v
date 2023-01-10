module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    // 1000 Hz clock -> 0.001s per clock cycle
    // BCD counter : 0~9 counter

    reg [3:0] Q1, Q2, Q3;
    bcdcount counter0 (clk, reset, c_enable[0], Q1);
    bcdcount counter1 (clk, reset, c_enable[1], Q2);
    bcdcount counter2 (clk, reset, c_enable[2], Q3);

    assign c_enable[0] = 1;
    assign c_enable[1] = (Q1==9) ? 1 : 0;
    assign c_enable[2] = (Q1==9&&Q2==9) ? 1 : 0;
    assign OneHertz = (Q1==9 && Q2==9 && Q3==9);

endmodule