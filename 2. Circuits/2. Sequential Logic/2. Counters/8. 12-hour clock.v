module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    // one clock cycle is a second
    wire ena1, ena2;
    always @(posedge clk) begin     // Hour : 01~12
        if (reset) begin
            hh <= 8'h12;
            pm <= 0;
        end
        else if (ena2) begin
            case (hh)
                8'h09   : hh <= 8'h10;
                8'h11   : begin 
                          hh <= 8'h12;
                          pm <= !pm; 
                          end
                8'h12    : hh <= 8'h01;
                default  : hh <= hh + 8'h01;
            endcase
        end
        else
            hh <= hh;
    end
    

    always @(posedge clk) begin     // Minute : 00~59
        if (reset)
            mm <= 8'h00;
        else if (ena1) begin
            case (mm)
                8'h09   : mm <= 8'h10; 
                8'h19   : mm <= 8'h20; 
                8'h29   : mm <= 8'h30; 
                8'h39   : mm <= 8'h40; 
                8'h49   : mm <= 8'h50; 
                8'h59   : mm <= 8'h00;
                default : mm <= mm + 8'h01; 
            endcase
        end
        else
            mm <= mm;
    end

    always @(posedge clk) begin     // Second : 00~59
        if (reset)
            ss <= 8'h00;
        else if (ena) begin
                case (ss)
                8'h09   : ss <= 8'h10; 
                8'h19   : ss <= 8'h20; 
                8'h29   : ss <= 8'h30; 
                8'h39   : ss <= 8'h40; 
                8'h49   : ss <= 8'h50; 
                8'h59   : ss <= 8'h00;
                default : ss <= ss + 8'h01; 
                endcase
        end
        else
            ss <= ss;
    end

    assign ena1 = (ss==8'h59) ? 1 : 0;
    assign ena2 = (ss==8'h59 && mm==8'h59) ? 1 : 0;

endmodule

/*
    11:59:58 PM > 11 59 59 pm > 12 00 00 am > 12 00 01 am ... 12 00 59 am > 12 01 00 am 
    ... > 12 59 58 am > 12 59 59 am > 13 00 00 am
*/

/* -------------------- Using Module --------------------- */

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire ena1, ena2, ena3, ena4;

    // code minute, second by using "digit" module
    // Hour can not be made by "digit" module, because of the hh0 range : 0, 1, 2, ... 9, 0, 1, 2, 0, 1, 2, 3 ...

    // Hour : 1~12
    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            pm <= 0;
        end 
        else if (ena4) begin
            case (hh)
                8'h09   : hh <= 8'h10;
                8'h11   : begin 
                          hh <= 8'h12;
                          pm <= !pm; 
                          end
                8'h12    : hh <= 8'h01;
                default  : hh <= hh + 8'h01;
            endcase
        end
        else
            hh <= hh;
    end

    // Minute : 0~59
    digit mm0 (.clk(clk), .reset(reset), .ena(ena2), .reset_q(0), .end_q(9), .q(mm[3:0]));
    digit mm1 (.clk(clk), .reset(reset), .ena(ena3), .reset_q(0), .end_q(5), .q(mm[7:4]));

    // Second : 0~59
    digit ss0 (.clk(clk), .reset(reset), .ena(ena), .reset_q(0), .end_q(9), .q(ss[3:0]));
    digit ss1 (.clk(clk), .reset(reset), .ena(ena1), .reset_q(0), .end_q(5), .q(ss[7:4]));

    assign ena1 = (ss[3:0] == 9 && ena == 1) ? 1 : 0;
    assign ena2 = (ss == 8'h59) ? 1 : 0;
    assign ena3 = ({mm[3:0], ss} == 12'h959) ? 1 : 0;
    assign ena4 = ({mm, ss} == 16'h5959) ? 1 : 0;

endmodule

module digit (
    input clk, reset, ena,
    input [3:0] reset_q, // reset시 초기화되는 수
    input [3:0] end_q,   // 표현할 수 있는 마지막 수
    output [3:0] q
);  
    always @(posedge clk) begin
        if (reset)
            q <= reset_q;
        else if (ena) begin
            if (q == end_q)
                q <= 0;
            else
                q <= q + 1;
        end 
        else 
            q <= q;
    end
endmodule
