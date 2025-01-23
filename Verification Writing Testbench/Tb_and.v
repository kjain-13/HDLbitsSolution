module top_module();
    reg [1:0] in;
    reg out;
    
    always begin
        in[1] = 0;
        in[0] = 0;
        // out = 0;
        #10;
        in[0] = 1;
        #10;
        in[1] = 1;
        in[0] = 0;
        #10;
        in[0] = 1;
        // out = 1;
        #20;
    end
    
    andgate inst1 (.in(in),.out(out));
    
endmodule
