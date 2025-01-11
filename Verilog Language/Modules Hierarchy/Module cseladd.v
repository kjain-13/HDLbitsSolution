module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	
    reg [15:0] a1,a2,b1,b2,o1,o2,o3;
    wire c1,c2,c3;
    
    assign {a1,a2,b1,b2} = {a,b};
    
    add16 inst1(a2,b2,0,o1,c1);
    add16 inst2(a1,b1,0,o2,c2);
    add16 inst3(a1,b1,1,o3,c3);
    
    assign sum = {(c1) ? o3: o2,o1};
    
endmodule
