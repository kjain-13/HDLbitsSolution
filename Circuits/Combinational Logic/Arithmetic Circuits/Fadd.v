module top_module( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout , sum} = {(a & cin) | (b & cin) | (a & b) , a ^ b ^ cin};

endmodule
