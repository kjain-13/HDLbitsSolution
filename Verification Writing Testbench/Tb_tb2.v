module top_module();
	reg clk = 0,in = 0 , out;
    reg [2:0]s = 2;
    
    always begin
        #5;
        clk = ~ clk;
    end
    
    initial begin
        #20;
       	in = 1;
        #10;
        in = 0;
        #10;
        in = 1;
        #30;
        in = 0;
    end
    
    initial begin
        #10;
        s = 3'h6;
        #10;
        s = 2;
        #10; 
        s = 7;
        #10;
        s = 0;
    end
    
    q7 inst1 (.clk(clk) , .in(in) , .out(out) , .s(s));
endmodule
