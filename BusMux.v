module BusMux(
	//encoder input
	input wire [23:0] EncIn,
	//R0Out,R1Out,R2Out,R3Out,R4Out,R5Out,R6Out,R7Out,R8Out,R9Out,R10Out,R11Out,R12Out,R13Out,R14Out,R15Out,hiOut, loOut ZhiOut, ZloOut, PCout, MDRout, inPortout,Cout
	input  [31:0] busin0,busin1,busin2,busin3,busin4,busin5,busin6,busin7,busin8,busin9,busin10,busin11,busin12,busin13,busin14,busin15,
	businhi,businlo,businZhi,businZlo,businPC,businMDR,businInport,csignextended,
	output  reg [31:0] busOut
	);
	reg [4:0] select;
	always @*
		case (EncIn)
		24'h000001:  select = 0;
		24'h000002:  select = 1;
		24'h000004:  select = 2;
		24'h000008:  select = 3;
		24'h000010:  select = 4;
		24'h000020:  select = 5;
		24'h000040:  select = 6;
		24'h000080:  select = 7;
		24'h000100:  select = 8;
		24'h000200:  select = 9;
		24'h000400:  select = 10;
		24'h000800:  select = 11;
		24'h001000:  select = 12;
		24'h002000:  select = 13;
		24'h004000:  select = 14;
		24'h008000:  select = 15;
		24'h010000:  select = 16;
		24'h020000:  select = 17;
		24'h040000:  select = 18;
		24'h080000:  select = 19;
		24'h100000:  select = 20;
		24'h200000:  select = 21;
		24'h400000:  select = 22;
		24'h800000:  select = 23;
		default 	:  select =0;
	endcase	
	always @*
		case (select)
		0	: busOut = busin0;
		1	: busOut = busin1;
		2	: busOut = busin2;
		3	: busOut = busin3;
		4	: busOut = busin4;
		5	: busOut = busin5;
		6	: busOut = busin6;
		7	: busOut = busin7;
		8	: busOut = busin8;
		9	: busOut = busin9;
		10	: busOut = busin10;
		11	: busOut = busin11;
		12	: busOut = busin12;
		13	: busOut = busin13;
		14	: busOut = busin14;
		15	: busOut = busin15;
		16	: busOut = businhi;
		17	: busOut = businlo;
		18	: busOut = businZhi;
		19	: busOut = businZlo;
		20	: busOut = businPC;
		21	: busOut = businMDR;
		22	: busOut = businInport;
		23	: busOut = csignextended;
		default 	: busOut = 32'bx;
	endcase
endmodule
