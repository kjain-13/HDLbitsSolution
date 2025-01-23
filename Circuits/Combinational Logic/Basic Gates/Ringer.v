module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always @(*) begin 
        motor = 0 ; 
        ringer = 0;
        if(ring) begin
            if(vibrate_mode)begin
                motor = 1;
            end
            else 
                ringer = 1;
        end
    end

endmodule
