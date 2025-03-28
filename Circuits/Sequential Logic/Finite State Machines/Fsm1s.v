// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 0 , B = 1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state = B;
            next_state = A;
            out = 1;
            // Fill in reset logic
        end else begin
            case (present_state)
                B : begin 
                    next_state = in ? A : B;
                    present_state = in ? B : A;
                end
                A : begin
                    next_state = in ? B : A;
                    present_state = in ? A : B;
                end
                // Fill in state transition logic
            endcase

            // State flip-flops

            case (present_state)
                A: out = 0;
                B: out = 1;
                // Fill in output logic
            endcase
        end
    end

endmodule
