module RX(
	input wire [31:0] D,
	output reg [31:0] Q,
	input clk, clr, le,
	);

	always @(posedge clk)
	begin
		if (clr == 0)
			Q <= 0;
		else if (le)
			Q <= D;
	end
endmodule
