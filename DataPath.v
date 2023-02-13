module Datapath(
	input [31:0] R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, Yin, HIin, LOin,
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout,
	input [31:0] InPortin, OutPortin, PCin, IRin, MDRin, MARin, Zin,
	input [31:0] InPortout, OutPortout, PCout, MDRout, MARout,
	input clk, le,
	input [31:0] mDataIn, MDRRead,
	
	
	output [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Y, HI, LO,
	output [31:0] InPort, OutPort, MDR, MAR,
	output [63:0] AluZout,
	);
	
	wire [31:0] bus, Yout, ZLOout, ZHIout;
	wire [31:0] busInR0, busInR1, busInR2, busInR3, busInR4, busInR5, busInR6, busInR7, busInR8, busInR9, busInR10, busInR11, busInR12, busInR13, 
	busInR14, busInR15, busInPC, busInPortIn, busInMDR, busInMAR, busInHI, busInLO, busInZHI, busInZLO, busInCsign; 
	wire clr;
	wire IRout;
	
	RX R0(bus, busInR0, clk, clr, R0in);
	RX R1(bus, busInR1, clk, clr, R1in);
	RX R2(bus, busInR2, clk, clr, R2in);
	RX R3(bus, busInR3, clk, clr, R3in);
	RX R4(bus, busInR4, clk, clr, R4in);
	RX R5(bus, busInR5, clk, clr, R5in);
	RX R6(bus, busInR6, clk, clr, R6in);
	RX R7(bus, busInR7, clk, clr, R7in);
	RX R8(bus, busInR8, clk, clr, R8in);
	RX R9(bus, busInR9, clk, clr, R9in);
	RX R10(bus, busInR10, clk, clr, R10in);
	RX R11(bus, busInR11, clk, clr, R11in);
	RX R12(bus, busInR12, clk, clr, R12in);
	RX R13(bus, busInR13, clk, clr, R13in);
	RX R14(bus, busInR14, clk, clr, R14in);
	RX R15(bus, busInR15, clk, clr, R15in);
	
	RX IR(bus, IRout, clk, clr, IRin);
	PC PC(bus, busInPC, clk, clr, PCin);
	RX MAR(bus, businMAR, clk, clr, Marin);
	MDR MDR(bus, busInMDR, MDRread, clr, clk, MDRin, mDataIn);
	
	RX HI(bus, busInHI, clk, clr, HIin);
	RX LO(bus, busInLO, clk, clr, LOin);
	RX Y(bus, Yout, clr, clk, Yin);
	RZ Z(AluZout, ZHIout, ZLOout, clk, clr, Zin);
	
	ALU alu(Yout, bus, AluZout);
	
	BusMux BM(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	HIout, LOout, ZHIout, ZLOout, PCout, MDRout, InPortout, Cout, busInR0, busInR1, busInR2, busInR3, busInR4, busInR5, busInR6, busInR7, busInR8, busInR9, busInR10, busInR11, busInR12, busInR13, 
	busInR14, busInR15, busInHI, busInLO, busInZHI, busInZLO, busInPC, busInMDR, busInPortIn, busInCsign, bus
	);
endmodule
	