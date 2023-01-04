module top_module (input x, input y, output z);

    assign z = (x^y) &x;

endmodule

/* module top_module (input x, input y, output z);

	wire tmp;
    xor(tmp, x, y);
    and(z, tmp, x);

endmodule */


