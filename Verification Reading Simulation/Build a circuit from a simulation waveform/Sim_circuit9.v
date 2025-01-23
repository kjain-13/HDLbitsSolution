module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if(a) q = 4'h4;
        else begin
            q = (q == 4'h6) ? 0 : q + 1;
        end
    end

endmodule
