// 먼저 전체적인 회로를 구성하고, 코드를 짜라

// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); 

    // 불필요한 latch 만들어지는거 방지하기 위해, 모든 입력에 출력이 존재해야 //
    // else, default 사용 //
    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
            shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else 
           keep_driving = 0;
    end

endmodule
