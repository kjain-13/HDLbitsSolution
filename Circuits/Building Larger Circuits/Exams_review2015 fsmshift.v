module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
	parameter A = 0 , B = 1, C = 2 , D = 3 , E = 4;
    reg[2:0] state,next;
    
    always @(*)begin
        case(state)
            A:begin
                next = B;
                shift_ena = 1;
            end
                B: next = C;
                C: next = D;
            	D: next = E;
                E: shift_ena = 0;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) begin
            state = A;
        end
        else state = next;
    end
    
endmodule
