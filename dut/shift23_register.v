module shift23_register(
  input wire clk,       // Clock input
  input wire rst,       // Reset input
  input wire [31:0] in, // Input data (31 bits wide)
  output reg [31:0] out  // Output data
);

  // Internal shift register
  reg [31:0] shift_reg [0:22];
  integer i;

  // Always block for shift register operation
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset all stages of the shift register to zero
      for (i = 0; i < 23; i = i + 1) begin
        shift_reg[i] <= 32'h00000000;
      end
    end else begin
      // Shift the data
      shift_reg[0] <= in;
      for (i = 1; i < 23; i = i + 1) begin
        shift_reg[i] <= shift_reg[i-1];
      end
    end
  end

  // Assign the output
  assign out = shift_reg[22];

endmodule
