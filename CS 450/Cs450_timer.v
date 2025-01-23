module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);	
    reg [10:0] counter;
    always @(posedge clk)begin
        if(load) begin
            counter = data + 1;
            tc = 0;
        end
        if(counter) counter = counter - 1;
        if(counter == 0) tc = 1;
       
    end

endmodule
