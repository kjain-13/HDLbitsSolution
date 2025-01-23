module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    parameter S = 0 , S1 = 1 , S11 = 2, S110 = 3 , B0 = 4 , B1 = 5 , B2 = 6 , B3 = 7 , Count = 8 , Wait = 9;
    reg [9:0] state,next;
    reg [11:0] smol_count;
    
    always@(posedge clk) begin
        if(reset) state = S;
        else begin
            case(state)
                S: next = (data) ? S1 : S ; 
                S1: next = (data) ? S11 : S ;
                S11: next = (data) ? S11 : S110 ;
                S110: next = (data) ? B0 : S;
                B0: begin count[3] = data; next = B1; end
                B1: begin count[2] = data; next = B2;end 
                B2: begin count[1] = data; next = B3; end 
                B3: begin count[0] = data ; next = Count; smol_count = 12'h3e7; 
                end 
                Count: begin
                    if (!count && !smol_count) next = Wait;
                        if (smol_count) begin
                            smol_count <= smol_count - 1;
                        end
                        else begin
                            count <= count - 1;
                            smol_count <= 999;
                        end
                	end
                Wait: begin
                    next = (ack) ? S : Wait;
            end
            endcase
            state = next;
        end
    end
    
    assign counting = (state == Count);
    assign done = state == Wait;

endmodule
