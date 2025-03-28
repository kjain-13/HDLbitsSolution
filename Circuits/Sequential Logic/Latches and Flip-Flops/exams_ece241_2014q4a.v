module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    always @(posedge clk) begin
        // Q = (E) ? (L) ? R : w : (L) ? R : Q ;
        Q = (L) ? R : (E) ? w : Q ; 
    end
    
endmodule
