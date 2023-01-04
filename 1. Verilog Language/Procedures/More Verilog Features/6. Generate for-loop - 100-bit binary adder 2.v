module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    /* Array instantiate */
    full_adder adder_100 [99:0] (.a(a), .b(b), 
                                 .cin({cout[98:0], cin}), 
                                 .cout(cout), 
                                 .sum(sum)     );
                                 
endmodule


module full_adder( 
    input a, b, cin,
    output cout, sum );
	
    assign cout = ((a ^ b) & cin) | (a & b);
    assign sum = (a ^ b ^ cin);
    
endmodule