module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
 parameter A = 0 , B = 1 , C = 2 , D = 3, E = 4, F = 5, G = 6 , H = 7 , I = 8 , J = 9 , K = 10 , L = 11;
    reg [3:0] state , next;
    
    always @(*) begin
        case(state) 
            A : next = (in) ? A : B ; 
            B : begin
                next = C;
                out_byte[0] = in;
            end
            C : begin
                next = D;
                out_byte[1] = in;
            end
            D : begin
                next = E;
                out_byte[2] = in;
            end
            E : begin
                next = F;
                out_byte[3] = in;
            end
            F : begin
                next = G;
                out_byte[4] = in;
            end
            G : begin
                next = H;
                out_byte[5] = in;
            end
            H : begin
                next = I;
                out_byte[6] = in;
            end
            I : begin
                next = J;
                out_byte[7] = in;
            end
            J : next = (in) ? K : L;
            K : next = (in) ? A : B; 
            L : next = (in) ? A : L;
        endcase
    end
    
    always @(posedge clk) begin
        state = (reset) ? A : next ;
    end
    
    assign done = state == K;
    // New: Datapath to latch input bits.

endmodule
