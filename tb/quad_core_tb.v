module quad_core_tb();

reg         clk; 
reg         rst;
reg         en ;
wire        fi0;
wire        fi1;
reg  [31:0]  a0; 
reg  [31:0]  b0; 
reg  [31:0]  c0; 
reg  [31:0]  d0; 
wire [31:0]  g0;
reg  [31:0]  a1; 
reg  [31:0]  b1; 
reg  [31:0]  c1; 
reg  [31:0]  d1; 
wire [31:0]  g1;
wire        fi2;
wire        fi3;
reg  [31:0]  a2; 
reg  [31:0]  b2; 
reg  [31:0]  c2; 
reg  [31:0]  d2; 
wire [31:0]  g2;
reg  [31:0]  a3; 
reg  [31:0]  b3; 
reg  [31:0]  c3; 
reg  [31:0]  d3; 
wire [31:0]  g3;


quad_core u_quad_core (.clk(clk), 
                       .rst(rst),
                       .en (en ),
                       .fi0(fi0),
	               .a0 ( a0), 
	               .b0 ( b0), 
	               .c0 ( c0), 
	               .d0 ( d0), 
	               .g0 ( g0),
                       .fi1(fi1),
	               .a1 ( a1), 
	               .b1 ( b1), 
	               .c1 ( c1), 
	               .d1 ( d1), 
	               .g1 ( g1),
	               .fi2(fi2),
	               .a2 ( a2), 
	               .b2 ( b2), 
	               .c2 ( c2), 
	               .d2 ( d2), 
	               .g2 ( g2),
                       .fi3(fi3),
	               .a3 ( a3), 
	               .b3 ( b3), 
	               .c3 ( c3), 
	               .d3 ( d3), 
	               .g3 ( g3));



initial begin
  clk=0; rst=1; en=0;
  #10 rst=0;
  @(posedge clk); 
// a0 = 1.0, b0 = 2.0, c0 = 3.0, d0 = 0.0
// output = 9.0 
  en=1;
  a0 = 32'h3f80_0000;
  b0 = 32'h4000_0000;
  c0 = 32'h4040_0000;
  d0 = 32'h0000_0000;
// a1 = 2.0, b1 = 3.0, c1 = 2.0, d1 = 1.0
// output = 9.0 
  a1 = 32'h4000_0000;
  b1 = 32'h4040_0000;
  c1 = 32'h4000_0000;
  d1 = 32'h3f80_0000;

// a0 = 3.0, b0 = 1.0, c0 = 1.0, d0 = 2.0
// output = 2.0 
  a2 = 32'h4040_0000;
  b2 = 32'h3f80_0000;
  c2 = 32'h3f80_0000;
  d2 = 32'h4000_0000;
// a1 = 4.0, b1 = 2.0, c1 = 1.0, d1 = 3.0
// output = 3.0
  a3 = 32'h4080_0000;
  b3 = 32'h4000_0000;
  c3 = 32'h3f80_0000;
  d3 = 32'h4040_0000;

  


  wait (fi0 & fi1 & fi2 & fi3) ;
 // @(posedge clk);
  en=0;
end

always #50 clk=~clk;
endmodule
