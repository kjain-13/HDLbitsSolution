module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state );
    always @(posedge clk) begin
        if(a & b) state = 1;
        if((a | b) == 0) state = 0;
    end
	assign q = a^b^state;
endmodule
