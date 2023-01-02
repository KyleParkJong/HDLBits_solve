module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    assign out[0] = in[sel*4];
    assign out[1] = in[sel*4+1];
    assign out[2] = in[sel*4+2];
    assign out[3] = in[sel*4+3];

    // Can't part select multiple bits without an error.
    // But, we can select one bit at a time.
    // 일부 비트를 선택하려면, 그 폭이 상수여야 하는데,
    // in[ sel*4+3 : sel*4 ]
    // 위와 같이 선언하면, 폭이 일정한지 시스템 상에서 증명할 수 없기 때문에
    // 한비트씩 선언하던가, 아래와 같이 정확한 상수로 폭을 표시해줘야한다.
    // assign out = in[sel*4 +: 4];
    // assign out = in[sel*4+3 -: 4];
endmodule
