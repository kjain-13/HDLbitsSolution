module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] R;
    always @(posedge clk)begin
        out <= (~resetn) ? 0 : R[2] ;
        R[2] <= (~resetn) ? 0 : R[1] ;
        R[1] <= (~resetn) ? 0 : R[0] ;
        R[0] <= (~resetn) ? 0 : in ;
    end

endmodule
