module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    integer i;
    reg [99:0] r1;
    always @(*) begin
        sum[0] = a[0] ^ b[0] ^ cin;
        r1[0] = (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin) ;
        for(i = 1 ; i < 100 ; i = i + 1)begin
            sum[i] = a[i] ^ b[i] ^ r1[i-1];
            r1[i] = (a[i] & b[i]) | (a[i] & r1[i-1]) | (b[i] & r1[i-1]);
        end
        cout = r1[99];
    end

endmodule
