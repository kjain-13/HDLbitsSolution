module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] r1 , r2 , r3;
    
    my_dff8 inst1(clk,d,r1);
    my_dff8 inst2(clk,r1,r2);
    my_dff8 inst3(clk,r2,r3);
    
    assign q = sel[1] ? (sel[0] ? r3 : r2) : (sel[0] ? r1 : d);
endmodule
