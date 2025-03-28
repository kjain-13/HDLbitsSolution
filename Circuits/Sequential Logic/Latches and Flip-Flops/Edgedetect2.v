module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] interm;
    always @(posedge clk) begin
        interm <= in;
        anyedge <= in ^ interm;
    end

endmodule
