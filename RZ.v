module RZ(
	input wire [63:0] D,
	output reg [31:0] Zhi, Zlo
	input clk, clr, le,
	);
	always @(posedge clk)
	begin
		if (clr == 0) begin
			Zhi <= 0;
			Zlo <= 0;
		end
		else if (le) begin
			Zhi <= D[63:32];
			Zlo <= D[31:0];
		end
	end
endmodule
