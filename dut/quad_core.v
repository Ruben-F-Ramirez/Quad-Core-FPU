module quad_core (input         clk,
		  input         rst,
	  	  input         en ,
	  	  input  [31:0] a0 ,
	  	  input  [31:0] b0 ,
	  	  input  [31:0] c0 ,
	  	  input  [31:0] d0 ,
	  	  output [31:0] g0 ,
	  	  output        fi0,
                  input  [31:0] a1 ,
                  input  [31:0] b1 ,
                  input  [31:0] c1 ,
                  input  [31:0] d1 ,
                  output [31:0] g1 ,
                  output        fi1,
                  input  [31:0]  a2,
                  input  [31:0]  b2,
                  input  [31:0]  c2,
                  input  [31:0]  d2,
                  output [31:0]  g2,
                  output        fi2,
                  input  [31:0]  a3,
                  input  [31:0]  b3,
                  input  [31:0]  c3,
                  input  [31:0]  d3,
                  output [31:0]  g3,
                  output        fi3);

fppu u0_fppu (.clk(clk),
	      .rst(rst),
	      .en (en ), 
	      .a0 (a0 ),
	      .b0 (b0 ),
              .c0 (c0 ),
     	      .d0 (d0 ),
              .a1 (a1 ),
              .b1 (b1 ),
              .c1 (c1 ),
              .d1 (d1 ),
              .g0 (g0 ),
              .g1 (g1 ),
     	      .fi0(fi0),
     	      .fi1(fi1));

fppu u1_fppu (.clk(clk),
	      .rst(rst),
	      .en (en ), 
	      .a0 (a2 ),
	      .b0 (b2 ),
              .c0 (c2 ),
     	      .d0 (d2 ),
              .a1 (a3 ),
              .b1 (b3 ),
              .c1 (c3 ),
              .d1 (d3 ),
              .g0 (g2 ),
              .g1 (g3 ),
     	      .fi0(fi2),
     	      .fi1(fi3));

endmodule
