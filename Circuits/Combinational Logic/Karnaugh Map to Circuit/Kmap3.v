module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	
    always @(*) begin
        out = 0;
        if(a) out =1;
        if(~a && ~b && c) out = 1;
    end
    
endmodule
