module top_module (input x, input y, output z);

    wire tmp1, tmp2, tmp3, tmp4;

    A a1 (x, y, tmp1);
    A a2 (x, y, tmp3);
    B b1 (x, y, tmp2);
    B b2 (x, y, tmp4);

    assign z = (tmp1 | tmp2) ^ (tmp3 & tmp4);

endmodule

module A (input x, input y, output z);

    assign z = (x^y) &x;

endmodule

module B ( input x, input y, output z );

    assign z = ~(x^y);

endmodule
