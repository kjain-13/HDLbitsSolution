module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg[3:0] state,next;
    // State transition logic
    always @(posedge clk or posedge areset) begin
        if(areset) state = 4'h1;
        else begin
        case(state) 
            1 : next = in ? 2 : 1 ;
            2 : next = in ? 2 : 4 ;
            4 : next = in ? 8 : 1 ;
            8 : next = in ? 2 : 4 ;
        endcase
            state = next;
        end
    end
    // Output logic
    assign out = (state == 4'h8);
endmodule
