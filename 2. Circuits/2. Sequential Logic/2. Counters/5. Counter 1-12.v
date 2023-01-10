module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    count4 the_counter (clk, c_enable, c_load, c_d, Q);
	
    assign c_enable = enable;
    assign c_d = c_load ? 1 : 0;
    assign c_load = (reset | (enable && Q==12));
    
endmodule