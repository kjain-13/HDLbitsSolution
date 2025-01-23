module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
	
    always @(*) begin
        heater = 0 ; 
        aircon = 0 ;
        fan = 1;
        if(mode)begin 
            heater = (too_cold)? 1 : 0 ;
            fan = (too_cold) ? 1 : 0 ;
        end
        else begin
            aircon = (too_hot) ? 1 : 0 ;
            fan = (too_hot) ? 1 : 0 ;
        end
        fan = (fan_on) ? 1 : fan;
    end
    
endmodule
