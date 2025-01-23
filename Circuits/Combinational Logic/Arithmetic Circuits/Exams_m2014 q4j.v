module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire w1,w2,w3,w4;
    assign {sum[0],w1} = {x[0] ^ y[0], x[0] & y[0]} ;
    assign {sum[1],w2} = {x[1] ^ y[1] ^ w1, (x[1] & y[1]) | (x[1] & w1) | (y[1] & w1)} ;
    assign {sum[2],w3} = {x[2] ^ y[2] ^ w2, (x[2] & y[2]) | (x[2] & w2) | (y[2] & w2)} ;
    assign {sum[3],w4} = {x[3] ^ y[3] ^ w3, (x[3] & y[3]) | (x[3] & w3) | (y[3] & w3)} ;
    assign sum[4] = w4;
 	
endmodule
