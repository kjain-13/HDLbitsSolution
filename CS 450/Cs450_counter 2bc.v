module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    always @(posedge clk or posedge areset) begin
        if(areset) state = 2'b01;
        else begin
            if(train_valid)begin
                state = (train_taken) ? (state == 3) ? state : state+1 : (state == 0) ? state : state-1 ;
            end
        end
    end

endmodule
