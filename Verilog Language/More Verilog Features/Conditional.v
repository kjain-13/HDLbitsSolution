module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    
    wire [7:0] interm1 , interm2;

    assign interm1 = (a < b) ? a : b;
    assign interm2 = (c < d) ? c : d;
    assign min = (interm1 < interm2) ? interm1 : interm2;
    
    // assign intermediate_result1 = compare? true: false;

endmodule
