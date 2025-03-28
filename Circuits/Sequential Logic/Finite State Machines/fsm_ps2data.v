module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter BYTE1 = 0 , BYTE2 = 1 , BYTE3 = 2 , DONE = 3;
    reg [1:0] state , next;
    reg[7:0] cnt;
    // State transition logic (combinational)
    always @(*)begin
        case(state) 
            BYTE1:begin
                next = (in[3]) ? BYTE2 : BYTE1; 
                cnt[7:0] = in;
            end
            BYTE2: begin
                next = BYTE3;
                out_bytes[23:16] = cnt;
                out_bytes[15:8] = in;
            end
            BYTE3: begin
                next = DONE;
                out_bytes[7:0] = in;
            end
            DONE: begin
                next = (in[3]) ? BYTE2 : BYTE1;
                cnt[7:0] = in;
            end
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk)begin
        if(reset) state = BYTE1;
        else state = next;
    end
    // Output logic
    assign done = state == DONE;

endmodule
