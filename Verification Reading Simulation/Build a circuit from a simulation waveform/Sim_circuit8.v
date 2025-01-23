module top_module (
    input clock,
    input a,
    output p,
    output q);
    reg q1 = 1;
    always @(negedge clock) begin;
        q1 <= a;
    end
    assign p = (clock) ? a : p ;
    assign q = q1;
endmodule
