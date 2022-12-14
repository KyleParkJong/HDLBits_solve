module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    full_adder adder3 [2:0] (
        .a(a),
        .b(b),
        .cin({cout[1:0], cin}),
        .cout(cout),
        .sum(sum)
    );

endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
	
    assign {cout, sum} = a + b + cin;
    
endmodule