module PC(
	input [31:0] PCNext,
	input clk, clr, PCWrite,
	output [31:0] PCResult,
	reg [31:0] PCResult);
	
	always @(posedge clk)
	begin
	if (clr == 0)
			PCResult <= 0;
		else if (PCWrite)
			PCResult <= PCNext;
	end
endmodule
