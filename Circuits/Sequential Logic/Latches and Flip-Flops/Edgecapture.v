module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] interm;
    always @(posedge clk) begin
        interm <= in;
        out = (reset) ? 0 : (~in & interm) | out ;
    end
endmodule
