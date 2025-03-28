module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    
    always @(*) begin
        Y1 = 0;
        Y3 = 0;
        if(w == 1 && y[0] == 1) Y1 = 1;
        if(w == 0 && (y[1] || y[5] || y[2] || y[4] )) Y3 = 1;
    end

endmodule
