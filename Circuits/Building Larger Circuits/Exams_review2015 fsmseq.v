module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    parameter A = 0 , B = 1 , C = 2 , D = 3, E = 4;
    reg[2:0] state , next;
    
    always @(*) begin
        case(state)
            A: begin
                next = (data) ? B : A ;
                start_shifting = 0;
            end
            B: next = (data) ? C : A ;
            C: next = (data) ? C : D ;
            D: next = (data) ? E : A ;
            E: start_shifting = 1;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state = A;
        else state = next;
    end
endmodule
