module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    
    always @(posedge clk) begin 
        if(load) q <= data;
        else if(ena[1] == 1 && ena[0] == 0) begin
            q[0] <= q[99];
            q[99:1] <= q[98:0];
        end
        else if(ena[1] == 0 && ena[0] == 1) begin
            q[99] <= q[0];
            q[98:0] <= q[99:1];
        end
    end

endmodule
