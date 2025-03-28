module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	parameter A = 0 , B = 1, C = 2, D = 3;
    reg [1:0] state,next;
    
    always @(*) begin
        case(state)
            A: begin
                next = (x) ? B : A ;
                z = 0;
            end
            B: next = (x) ? B : C ;
            C:begin
                next = (x) ? D : A ;
                if(x == 1) z =1;
                else z = 0;
            end
            D:begin
                z = 0;
                next = (x) ? B : C ;
            end
        endcase
    end
    always @(posedge clk or negedge aresetn) begin
        if(aresetn == 0) begin
            state = A;
        end
        else begin
            state = next;
        end
    end
endmodule
