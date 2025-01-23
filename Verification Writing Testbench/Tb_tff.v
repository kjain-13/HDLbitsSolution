module top_module ();
	reg clk = 0,reset = 0,t = 0,q;
    always begin
        #5;
        clk = ~ clk;
    end
    always begin
        #20;
        reset = ~reset;
    end
    always begin
        #10;
        t = 1;
        #10
        t = 0;
    end
    
    tff inst1 (clk,reset,t,q);
endmodule
