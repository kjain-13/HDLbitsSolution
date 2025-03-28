module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT = 0 , RIGHT = 1 , FALL = 2 ;
    reg [2:0] state , next , PREV;
    
    always @(*) begin
        case(state) 
            LEFT : next = (ground) ? (bump_left) ? RIGHT : LEFT : FALL;
            RIGHT : next = (ground) ? (bump_right) ? LEFT : RIGHT : FALL;
            FALL : next = (ground) ? PREV : FALL;
        endcase
        PREV = (state != FALL) ? state : PREV ; 
    end
    always @(posedge clk or posedge areset) begin
        if(areset) state = LEFT;
        else state = next;
    end
    
    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;
    assign aaah = state == FALL;

endmodule
