module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter A = 0 , B = 1 , C = 2 , D = 3, E = 4, F = 5, G = 6 , H = 7 , I = 8 , J = 9 , K = 10 , L = 11;
    reg [3:0] state , next;
    
    always @(*) begin
        case(state) 
            A : next = (in) ? A : B ; 
            B : next = C;
            C : next = D;
            D : next = E;
            E : next = F;
            F : next = G;
            G : next = H;
            H : next = I;
            I : next = J;
            J : next = (in) ? K : L;
            K : next = (in) ? A : B; 
            L : next = (in) ? A : L;
        endcase
    end
    
    always @(posedge clk) begin
        state = (reset) ? A : next ;
    end
    
    assign done = state == K;

endmodule
