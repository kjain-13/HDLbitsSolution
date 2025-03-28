module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    always @(posedge clk) begin
        if(reset) begin
            hh = 8'h12;
            mm = 0; 
            ss = 0;
            pm = 0;
        end
        else begin
        if(ena) begin
        if(hh == 0 && mm == 0 && ss == 0)begin
            hh = 8'h12;
            pm = 1;
        end
        else if(hh == 8'h12 && mm == 8'h59 && ss == 8'h59)begin 
            hh = 8'h01;
            mm = 0;
            ss = 0;
        end
        else if(mm == 8'h59 && ss == 8'h59) begin
            hh = (hh == 8'h09) ? 8'h10 : hh + 1;
            mm = 0; 
            ss = 0;
        end
        else if(ss == 8'h59)begin
            mm = (mm[3:0] == 4'h9) ? mm + 7 : mm + 1 ; 
            ss = 0;
        end
        else ss = (ss[3:0] == 4'h9) ? ss + 7 : ss + 1;
        if(hh == 8'h12 && mm == 8'h00 && ss == 8'h00)begin 
            pm = ~pm;
        end
        end
        end
    end
endmodule
