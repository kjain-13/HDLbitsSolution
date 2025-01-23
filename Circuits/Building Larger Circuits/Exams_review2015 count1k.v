module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    always@(posedge clk) begin
        if(reset) q = 10'h000;
        else q = (q == 10'h3e7) ? 0 : q + 1;
    end

endmodule
