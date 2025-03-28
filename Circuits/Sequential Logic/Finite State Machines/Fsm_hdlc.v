module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter A = 0 , B = 1 , C = 2 , D = 3, E = 4 , F = 5 , G = 6 , H = 7 , I = 8 , J = 9 , K = 10 ;
    reg [3:0] state , next;
    always @(*) begin
        case(state)
            A : next = (in) ? B : A ;
            B : next = (in) ? C : A ;
            C : next = (in) ? D : A ;
            D : next = (in) ? E : A ;
            E : next = (in) ? F : A ;
            F : next = (in) ? G : J ;
            J : next = (in) ? B : A;
            G : next = (in) ? H : K ;
            K : next = (in) ? B : A;
            H : next = (in) ? H : A ;
        endcase
    end
    always @(posedge clk) begin
        state = (reset) ? A : next;
    end
    
    assign disc = state == J;
    assign flag = state == K;
    assign err = state == H;
endmodule
