module FP_datapath (input         clk     ,
                    input         rst     ,
		    input         io_in_en_a,
		    input         io_in_en_m,
		    input         io_in_en_s,
	            input  [31:0] a       , 
	            input  [31:0] b       , 
	            input  [31:0] c       , 
	            input  [31:0] d       , 
	            output [31:0] g       );
wire [31:0] e;
wire [31:0] f;
FP_adder_13ccs FP_adder(.clock   (clk     ),
                     .reset   (rst     ),
		     .io_in_en(io_in_en_a),
                     .io_in_a (a       ),
                     .io_in_b (b       ),
                     .io_out_s(e       ));

FP_multiplier_10ccs FP_multiplier (.clock   (clk     ),
                     .reset   (rst     ),
		     .io_in_en(io_in_en_m),
                     .io_in_a (e       ),
                     .io_in_b (c       ),
                     .io_out_s(f       ));

FP_subtractor_13ccs FP_subber (.clock   (clk     ),
                     .reset   (rst     ),
		     .io_in_en(io_in_en_s),
                     .io_in_a (f       ),
                     .io_in_b (d       ),
                     .io_out_s(g       ));

endmodule
