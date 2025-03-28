module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    reg [6:1] next;
    
    always @(*) begin
        Y2 = 0;
        Y4 = 0;
        if(w == 0 && y[1] == 1) Y2 = 1;
        if(w == 1 && (y[2] || y[3] || y[5] || y[6])) Y4 = 1;
    end

endmodule
