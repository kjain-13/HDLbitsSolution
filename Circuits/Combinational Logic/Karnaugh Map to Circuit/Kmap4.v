module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    always @(*) begin
        out = 0;
    	if(a^b^c^d) out = 1;
    end

endmodule
