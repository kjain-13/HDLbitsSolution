module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter LEFT = 0 , RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4 , DIG_R = 5 , SPLAT = 6;
    reg [2:0] state , next ;
    integer count = 0;
    
    always @(*) begin
        case(state) 
            LEFT : next = (ground) ? (dig) ? DIG_L : (bump_left) ? RIGHT : LEFT : FALL_L;
            RIGHT : next = (ground) ? (dig) ? DIG_R : (bump_right) ? LEFT : RIGHT : FALL_R;
            FALL_L :next = (ground) ? (count > 20) ? SPLAT : LEFT : FALL_L ;
            FALL_R :next = (ground) ? (count > 20) ? SPLAT : RIGHT : FALL_R ;
            DIG_L : next = (ground) ? DIG_L : FALL_L ; 
            DIG_R : next = (ground) ? DIG_R : FALL_R ; 
            SPLAT : next = SPLAT;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) begin
            state = LEFT;
            count = 0;
        end
        else begin
            state = next;
            count = (state == FALL_L || state == FALL_R) ? count + 1 : 0;
        end
    end
    
    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;
    assign aaah = (state == FALL_L || state == FALL_R);
    assign digging = (state == DIG_L || state == DIG_R);
endmodule
