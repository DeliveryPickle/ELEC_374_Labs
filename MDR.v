module MDR(
	input [31:0] busMuxOut, mdatain,
	input read, clr, clk, mdrin,
	output reg [31:0] q
	);
	reg [31:0] d;
	always @(posedge clk)
	begin
	if (read == 0) d = busMuxOut; else d = mdatain;
	
	if (clr == 0)
		q <= 0;
	else if (mdrin)
		q <= d;
	end
endmodule
