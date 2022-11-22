// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 

    /* 불필요한 latch를 만들지 않기 위해서, 모든 입력에 출력값이 존재해야한다. */
    /* 모든 case를 나열하기 보다는, default 값을 case문 앞에 넣으므로써 코드 간략화할 수 있다. */
    always @ (*) begin
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;	// 모든 입력에 출력이 있다. (case문에 해당되지 않더라도)
        case (scancode)
            16'he06b 	: left 	= 1'b1;
            16'he072 	: down 	= 1'b1;
            16'he074 	: right = 1'b1;
            16'he075 	: up 	= 1'b1;
        endcase
    end
    
endmodule
