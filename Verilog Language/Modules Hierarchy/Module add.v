module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    reg c,c1;
    reg [15:0] a1,a2,b1,b2,o1,o2;
    assign {a1,a2,b1,b2} = {a,b};
    add16 inst1 (a2,b2, 0 , o1, c);
    add16 inst2 (a1,b1, c , o2, c1);
    assign sum = {o2,o1};

endmodule
