module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        q = (reset) ? 0 : (slowena) ? (q > 8) ? 0 : q+1 : q ;
    end

endmodule
