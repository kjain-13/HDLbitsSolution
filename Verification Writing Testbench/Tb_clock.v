module top_module ( );
	reg clk = 0;
    always begin
    	#5 ;
        clk = ~clk;
    end
    dut inst1 (clk) ;
endmodule
