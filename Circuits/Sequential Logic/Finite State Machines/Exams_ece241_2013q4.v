module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] next;

    always @(posedge clk)begin
        next = fr3 + fr2 + fr1;
        if(reset) begin
            fr3 = 1; 
            fr2 = 1;
            fr1 = 1;
            dfr = 1;
        end
        else begin
            case(s)
                3'h1 :  begin
                    fr3 = 0;
                    fr2 = 1;
                    fr1 = 1;
                    dfr = (next == 2) ? dfr : (next < 2) ? 1 : 0 ;
                end
                3'h3 :begin
                    fr3 = 0;
                    fr2 = 0;
                    fr1 = 1;
                    dfr = (next == 1) ? dfr : (next < 1) ? 1 : 0 ;
                end
                3'h7 :begin
                    fr3 = 0;
                    fr2 = 0;
                    fr1 = 0;
                    dfr = 0 ;
                end
                default : begin
                    fr3 = 1;
                    fr2 = 1;
                    fr1 = 1;
                    dfr = 1;
                end
            endcase
        end
    end

endmodule
