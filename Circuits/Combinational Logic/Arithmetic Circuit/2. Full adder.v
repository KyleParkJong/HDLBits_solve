module top_module( 
    input a, b, cin,
    output cout, sum );
	
    assign {cout, sum} = a + b + cin;
    
endmodule

/* module full_adder( 
    input a, b, cin,
    output cout, sum );
	
    assign cout = ((a ^ b) & cin) | (a & b);
    assign sum = (a ^ b ^ cin);
    
endmodule */