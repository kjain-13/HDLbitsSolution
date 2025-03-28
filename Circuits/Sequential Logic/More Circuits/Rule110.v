module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    integer i;
    reg [512:-1] r1;
    always @(posedge clk) begin
        if(load) q = data;
        else begin
            r1[511 : 0] = q;
            for(i = 0 ; i < 512 ; i = i+1) begin
                if(r1[i+1] == 1 && r1[i] ^ r1[i-1] == 0) q[i] = 0;
                else if(~r1[i-1] && ~r1[i] && ~r1[i+1]) q[i] = 0;
                else q[i] = 1;
            end
        end
    end

endmodule
