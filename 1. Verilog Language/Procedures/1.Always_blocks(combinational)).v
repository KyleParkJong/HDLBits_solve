// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

    assign out_assign = a & b;
    
    always @(*) begin
    	out_alwaysblock = a & b; // always문 안의 comb. logic은 blocking문으로
    end
    
endmodule