module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    integer i;
    reg [511:0] o1;
    always @(posedge clk) begin
        if(load) q = data;
        else begin
            o1[0] = q[1];
            o1[511] = q[510];
            for(i = 1 ; i < 511 ; i = i + 1) begin
                o1[i] = q[i-1] ^ q[i+1];
            end
            q = o1;
        end
        
    end

endmodule
