module top_module(
    input clk,
    input in,
    input reset,
    output out); //
	parameter A = 1 , B = 2 , C = 4 , D = 8;
    reg [3:0] state,next;
    // State transition logic
    always @(*) begin
        case(state) 
            A: next = (in) ? B : A;
            B: next = (in) ? B : C;
            C: next = (in) ? D : A;
            D: next = (in) ? B : C ;
        endcase
    end

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset) state = 1'h1;
        else state = next;
    end
    // Output logic
    assign out = state == D;
endmodule
