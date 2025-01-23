module top_module (input a, input b, input c, output out);//
	
    reg o1;
    andgate inst1 (.a(a) ,.b(b) , .c(c) , .d(1) ,.e(1) , .out(o1));
    assign out = ~o1;
    
endmodule
