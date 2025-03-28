module top_module (
    input clk,
    input x,
    output z
); 
    wire w1,w2,w3,w4,w5,w6;
    
    dff1 inst1(x,w1,clk,w1,w2);
    dff2 inst2(x,w3,clk,w3,w4);
    dff3 inst3(x,w5,clk,w5,w6);
    
    assign z = ~(w1 | w3 | w5);

endmodule

module dff1 (input x , input q , input clk , output Q , output Q_bar);
    always @(posedge clk) begin
        Q = x ^ q;
        Q_bar = ~q;
    end
endmodule

module dff2 (input x , input q , input clk , output Q , output Q_bar);
    always @(posedge clk) begin
        Q = x & ~q;
        Q_bar = ~q;
    end
endmodule

module dff3 (input x , input q , input clk , output Q , output Q_bar);
    always @(posedge clk) begin
        Q = x | ~q;
        Q_bar = ~q;
    end
endmodule