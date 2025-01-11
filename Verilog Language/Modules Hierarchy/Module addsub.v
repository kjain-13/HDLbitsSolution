module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    reg [31:0] bnew; 
    assign bnew = (sub) ? ~b : b ;
    
    reg [15: 0] a1,a2,b1,b2,o1,o2;
    wire c1,c2;
    
    assign {a1,a2,b1,b2} = {a,bnew};
    
    add16 inst1(a2,b2,sub,o1,c1);
    add16 inst2(a1,b1,c1,o2,c2);
    
    assign sum = {o2,o1};
    
endmodule
