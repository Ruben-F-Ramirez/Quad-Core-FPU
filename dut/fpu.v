module fpu (input         clk, 
            input         rst,
            input         en ,
            output        fi ,
	    input  [31:0] a  , 
	    input  [31:0] b  , 
	    input  [31:0] c  , 
	    input  [31:0] d  , 
	    output [31:0] g  );

wire en_a, en_m, en_s;
reg en1, en2, en3, en4;
wire [31:0] mul_in,sub_in;

FP_datapath u_FP_datapath (.clk       (clk       ),
                           .rst       (rst       ),
			   .io_in_en_a(en_a      ),
			   .io_in_en_m(en_m      ),
			   .io_in_en_s(en_s      ),
	                   .a         (a         ), 
	                   .b         (b         ), 
	                   .c         (mul_in    ), 
	                   .d         (sub_in    ), 
	                   .g         (g         ));

shift13_register u_shift13_register(.clk(clk     ),
				    .rst(rst     ),
				    .in (c       ),
				    .out(mul_in  ));

shift23_register u_shift23_register(.clk(clk     ),
				    .rst(rst     ),
				    .in (d       ),
				    .out(sub_in  ));


timing_ctl u1_timing_ctl (.clk       (clk        ), 
                         .rst        (rst        ),
			 .io_out_en_a(en_a1      ),
			 .io_out_en_m(en_m1      ),
			 .io_out_en_s(en_s1      ),
			 .add_vld    (add_vld1   ),
			 .mul_vld    (mul_vld1   ),       
		         .sub_vld    (sub_vld1   ),
	                 .en         (en         ),
	                 .fi         (fi1        ));


timing_ctl u2_timing_ctl (.clk       (clk        ), 
                         .rst        (rst        ),
			 .io_out_en_a(en_a2      ),
			 .io_out_en_m(en_m2      ),
			 .io_out_en_s(en_s2      ),
			 .add_vld    (add_vld2   ),
			 .mul_vld    (mul_vld2   ),       
		         .sub_vld    (sub_vld2   ),
	                 .en         (en2        ),
	                 .fi         (fi2        ));

timing_ctl u3_timing_ctl (.clk       (clk        ), 
                         .rst        (rst        ),
			 .io_out_en_a(en_a3      ),
			 .io_out_en_m(en_m3      ),
			 .io_out_en_s(en_s3      ),
			 .add_vld    (add_vld3   ),
			 .mul_vld    (mul_vld3   ),       
		         .sub_vld    (sub_vld3   ),
	                 .en         (en3        ),
	                 .fi         (fi3        ));

timing_ctl u4_timing_ctl (.clk       (clk        ), 
                         .rst        (rst        ),
			 .io_out_en_a(en_a4      ),
			 .io_out_en_m(en_m4      ),
			 .io_out_en_s(en_s4      ),
			 .add_vld    (add_vld4   ),
			 .mul_vld    (mul_vld4   ),       
		         .sub_vld    (sub_vld4   ),
	                 .en         (en4        ),
	                 .fi         (fi4        ));

assign en_a = en_a1 | en_a2 | en_a3 | en_a4;
assign en_m = en_m1 | en_m2 | en_m3 | en_m4; 
assign en_s = en_s1 | en_s2 | en_s3 | en_s4;

assign fi = fi1 | fi2 | fi3 | fi4;

assign add_vld = add_vld1 | add_vld2 | add_vld3 | add_vld4;
assign mul_vld = mul_vld1 | mul_vld2 | mul_vld3 | mul_vld4;
assign sub_vld = sub_vld1 | sub_vld2 | sub_vld3 | sub_vld4;

//-------------------- pipeline for counters ------------------------
always @(posedge clk, posedge rst) begin
	if (rst) begin
		en2 <= 0;
		en3 <= 0;
		en4 <= 0;
	end else begin
		en2 <= en;
		en3 <= en2;
		en4 <= en3;
	end

end


endmodule
