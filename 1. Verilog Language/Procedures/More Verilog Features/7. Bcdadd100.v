module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);
    
    wire [100:0] cout_w;
	genvar i;
    
    generate
        for (i=0; i<100; i=i+1) begin : 100_loop
            bcd_fadd adder400 (
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cout_w[i]),
                .cout(cout_w[i+1]),
                .sum(sum[4*i+3:4*i])
            );
        end
    endgenerate
    
    assign cout_w[0] = cin;
    assign cout = cout_w[100];
    
endmodule

/* modul def */
module bcd_fadd(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output cout,
    output [3:0] sum
);
    
    wire [4:0] cout_w;

    genvar i;

    generate
        for (i=0; i<4; i=i+1) begin : 4_loop
            full_adder adder4 (
                .a(a[i]),
                .b(b[i]),
                .cin(cout_w[i]),
                .cout(cout_w[i+1]),
                .sum(sum[i])
            );
        end
    endgenerate
    
    assign cout = cout_w[4];
    assign cout_w[0] = cin;

endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
	
    assign cout = ((a ^ b) & cin) | (a & b);
    assign sum = (a ^ b ^ cin);
    
endmodule