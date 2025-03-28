module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    always @(posedge clk) begin
        ena = 0;
        if(reset) q = 0;
        else begin
            if(q == 16'h9999) q = 0;
            else if(q[11:0] == 12'h999 ) begin
                q[11:0] = 12'h000;
                q[15:12] = q[15:12] + 1;
            end
            else if(q[11:0] == 12'h998 ) begin
               	q = q+1;
                ena[3] = 1;
                ena[2] = 1;
                ena[1] = 1;
            end
            else if(q[7:0] == 8'h99 ) begin
                q[7:0] = 8'h00;
                q[15:8] = q[15:8] + 1;
            end
            else if(q[7:0] == 8'h98 ) begin
                q = q+1;
                ena[2] = 1;
                ena[1] = 1;
            end
            else if(q[3:0] == 4'h9 ) begin
                q[3:0] = 4'h0;
                q[15:4] = q[15:4] + 1;
            end
            else if(q[3:0] == 4'h8 ) begin
                q = q+1;
                ena[1] = 1;
            end
            else q = q + 1; 
            
        end
    end
	
    
endmodule
