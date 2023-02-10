`timescale 1ns/10ps
module bus_tb;
	reg [23:0] EncIn;
	reg [31:0]busin0,busin1,busin2,busin3,busin4,busin5,busin6,busin7,busin8,busin9,busin10,busin11,busin12,
	busin13,busin14,busin15,businhi,businlo,businZhi,businZlo,businPC,businMDR,businInport,csignextended;
	wire [31:0]busOut;
	//reg select;

	
	BusMux UUT( EncIn, 
		busin0,busin1,busin2,busin3,busin4,busin5,busin6,busin7,busin8,busin9,busin10,busin11,busin12,
		busin13,busin14,busin15,businhi,businlo,businZhi,businZlo,businPC,businMDR,businInport,csignextended,
		busOut
	);
	
	initial begin
	
	EncIn = 1;
	busin0 = 23;
	#20
	
	EncIn = 8;
	busin0 = 0;
	busin12 = 1;
	
	#20
	busin12 = 0;
	EncIn = 24'h800000;
	businPC = 1;
	#20
	businPC = 0;
	
	end
	
endmodule
	