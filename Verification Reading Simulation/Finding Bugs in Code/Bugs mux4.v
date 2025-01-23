module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    reg [7:0] mux0, mux1;
    mux2 mux3 ( sel[0],    a,    b, mux0 );
    mux2 mux4 ( sel[0],    c,    d, mux1 );
    mux2 mux5 ( sel[1], mux0, mux1,  out );

endmodule
