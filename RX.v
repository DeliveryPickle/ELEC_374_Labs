module RX(D, Q, clk, clr, le);
	input wire [31:0] D;
	input clk, clr, le;
	output reg [31:0] Q;
	always @(posedge clk)
	begin
		if (clr == 0)
			Q <= 0;
		else if (le)
			Q <= D;
	end
endmodule
