`timescale 1ns/10ps
module bus_tb;
	reg R0Out,R1Out,R2Out,R3Out,R4Out,R5Out,R6Out,R7Out,R8Out,R9Out,R10Out,R11Out,R12Out,R13Out,R14Out,R15Out,hiOut, loOut, ZhiOut, ZloOut, PCout, MDRout, inPortout,Cout;
	reg [31:0]busin0,busin1,busin2,busin3,busin4,busin5,busin6,busin7,busin8,busin9,busin10,busin11,busin12,
	busin13,busin14,busin15,businhi,businlo,businZhi,businZlo,businPC,businMDR,businInport,csignextended;
	wire [31:0]busOut;
	//reg select;

	
	BusMux UUT(R0Out,R1Out,R2Out,R3Out,R4Out,R5Out,R6Out,R7Out,R8Out,R9Out,R10Out,R11Out,R12Out,R13Out,R14Out,R15Out,hiOut, loOut, ZhiOut, ZloOut, PCout, MDRout, inPortout,Cout, 
		busin0,busin1,busin2,busin3,busin4,busin5,busin6,busin7,busin8,busin9,busin10,busin11,busin12,
		busin13,busin14,busin15,businhi,businlo,businZhi,businZlo,businPC,businMDR,businInport,csignextended,
		busOut
	);
	
	initial begin
	R0Out = 1;
	busin0 = 23;
	#20
	
	R0Out = 0;
	busin0 = 0;
	R12Out = 1;
	busin12 = 4;
	
	#20
	busin12 = 0;
	businPC = 1;
	
	#20
	businPC = 0;
	
	end
	
endmodule
	