module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
	
    always @(posedge clk) begin
        if(shift_ena) begin
            q[3] <= q[2];
            q[2] <= q[1];
            q[1] <= q[0];
            q[0] <= data;
        end
        if(count_ena) begin
            q <= (q == 0) ? 4'hf : q - 1;
        end
    end
    
endmodule
