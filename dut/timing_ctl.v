module timing_ctl(input  clk       , 
                  input  rst       ,
	          input  en        ,
		  output io_out_en_a,
		  output io_out_en_m,
		  output io_out_en_s,
		  output add_vld   ,
		  output mul_vld   ,
		  output sub_vld   ,
	          output fi        );

reg  [5:0] cnt  ;
wire [5:0] nxt_cnt = (cnt==6'd36) ? 6'd0 : 
                                     en ? cnt+6'd1 : cnt;

always @(posedge clk, posedge rst) begin
  if(rst) begin
    cnt <= 6'h0;
  end else begin
    cnt <= nxt_cnt;
  end
end
//---------------- FP OPERATOR CONTROL -----------------
assign io_out_en_a = en & ((cnt >= 6'd0)  & (cnt <= 6'd12 ));
assign io_out_en_m = en & ((cnt >= 6'd13)  & (cnt <= 6'd22));
assign io_out_en_s = en & ((cnt >= 6'd23) & (cnt <= 6'd35));

//---------------- READY VALID SIGNALS ------------------
assign add_vld = (cnt == 6'd13 );
assign mul_vld = (cnt == 6'd23);
assign sub_vld = (cnt == 6'd36);
assign fi = cnt==6'd36;
endmodule
