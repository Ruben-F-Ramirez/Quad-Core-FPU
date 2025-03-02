module fppu (input             clk,
	     input             rst,
	     input             en , 
	     input      [31:0] a0 ,
	     input      [31:0] b0 ,
             input      [31:0] c0 ,
     	     input      [31:0] d0 ,
             input      [31:0] a1 ,
             input      [31:0] b1 ,
             input      [31:0] c1 ,
             input      [31:0] d1 ,
             output     [31:0] g0 ,
             output     [31:0] g1 ,
     	     output            fi0,
     	     output            fi1);

fpu core0   (.clk(clk ), 
             .rst(rst ),
             .en (en  ),
             .fi (fi0 ),
	     .a  (a0  ), 
	     .b  (b0  ), 
	     .c  (c0  ), 
	     .d  (d0  ), 
	     .g  (g0  ));

fpu core1   (.clk(clk ), 
             .rst(rst ),
             .en (en  ),
             .fi (fi1 ),
	     .a  (a1  ), 
	     .b  (b1  ), 
	     .c  (c1  ), 
	     .d  (d1  ), 
	     .g  (g1  ));

endmodule
