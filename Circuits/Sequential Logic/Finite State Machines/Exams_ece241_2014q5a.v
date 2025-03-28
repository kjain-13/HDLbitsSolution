module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	parameter A = 0 , B = 1 , C = 2;
    reg[1:0]  state , next;
    
    always @(*) begin
        case(state)
            A: next = (x) ? C : A;
            B: next = B;
            C: next = B;
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if(areset)begin
            state = A;
            z = 0;
        end
        else begin
            state = next;
            case(state)
                    A: z = x;
                    B: z = ~x;
                	C: z = x;
            endcase
        end
    end
endmodule
