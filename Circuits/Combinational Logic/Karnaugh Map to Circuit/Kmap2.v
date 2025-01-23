module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    always @(*) begin
        out = 1;
        if(a && b && ~c) out = 0;
        if(~c && d && b) out = 0;
        if(~a && ~b && c && d) out = 0;
        if(c && ~d && a) out = 0;
    end

endmodule
