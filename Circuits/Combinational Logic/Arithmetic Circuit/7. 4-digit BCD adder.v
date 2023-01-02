module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    /* draw the circuit first */

    wire [4:0] cout_wire;
    genvar i;

    generate
        for (i=0; i<4; i=i+1) begin : loop
            bcd_fadd u0 (
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cout_wire[i]),
                .cout(cout_wire[i+1]),
                .sum(sum[4*i+3:4*i])
            );
        end
    endgenerate
	
    assign cout_wire[0] = cin;
    assign cout = cout_wire[4];
    
endmodule