module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A = 0 , B = 1 , C = 2 , D = 3 , E = 4 , F = 5, G = 6 , H = 7 , I = 8 , J = 9;
    reg [3:0] state ,next;
    always @(*) begin
        case(state)
            A: begin
                next = B;
                f = 0;
                g = 0;
            end
            B: begin
               f = 1;
               next = C;
            end
            C: begin
               f = 0;
               next = (x) ? D : C ;
            end
            D: next = (x) ? D : E ;
            E: next = (x) ? F : C ;
            F: begin
                next = G;
                g = 1;
            end
            G: next = (y) ? I : J ;
            I: g = 1;
            J: g = 0;
        endcase
    end
    always @(posedge clk) begin
        if(!resetn) state = A;
        else state = next;
    end
    

endmodule
