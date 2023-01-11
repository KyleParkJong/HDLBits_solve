module clock_12h (clk, reset, h, m, s);
    input clk, reset;
    output reg [4:0] h, m, s;

    reg [11:0] cnt;
    always @(posedge clk) begin
        if (reset) begin
            cnt <= 0;
        end else begin
            cnt <= cnt + 1;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            h <= 0;
            m <= 0;
            s <= 0;
        end else begin
            if (cnt == (12*60*60)-1) begin
                cnt <= 0;
                h <= 0;
                m <= 0;
                s <= 0;
            end else begin
                s <= cnt % 60;
                m <= (cnt / 60) % 60;
                h <= (cnt / (60*60)) % 12;
            end
        end
    end
endmodule