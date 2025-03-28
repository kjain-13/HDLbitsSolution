module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 0, B = 1, C1 = 2 , C2 = 3 , C3 = 4 , D1 = 5 , D2 = 6 , D3 = 7 ;
    reg [2:0] state,next;
    always @(*) begin
        case(state)
            A: next = (s) ? B : A ;
            B: begin
                next = (w) ? C1 : D1 ;
                z = 0;
            end
            C1: next = (w) ? C2 : D2 ;
            C2: next = (w) ? B : C3 ;
            C3:begin
                next = (w) ? C1 : D1;
                z = 1;
            end
            D1: next = (w) ? D2 : D3 ;
            D2: next = (w) ? C3 : B ;
            D3: next = B;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) state = A;
        else state = next;
    end

endmodule
