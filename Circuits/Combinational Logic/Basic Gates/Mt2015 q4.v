module top_module (input x, input y, output z);
	
    wire w1,w2,w3,w4,w5,w6;
    subA inst1 (x,y,w1);
    subB inst2 (x,y,w2);
    subA inst3 (x,y,w3);
    subB inst4 (x,y,w4);
    
    assign w5 = w1 | w2;
    assign w6 = w3 & w4;
    assign z = w5 ^ w6;
    
endmodule

module subA(input x , input y ,output z);
    assign z = (x^y) & x;
endmodule

module subB(input x , input y ,output z);
    assign z = ~(x^y);
endmodule