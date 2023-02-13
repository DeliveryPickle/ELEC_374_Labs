`timescale 1ns/10ps
module ALU_tb;
	reg [31:0] a, b; 
	reg [3:0] op; 
	wire [63:0] result;
	
	ALU UUT(
	a,b,op,result
	);
	
	initial begin
		//And
		a = 1;
		b = 0;
		op = 0;
		
		#20
		//Or
		op = 1;
		
		#20
		//Add
		a = 12;
		b = 28;
		op = 2;
		
		#20
		//Subtract
		a = 32;
		b = 20;
		op = 3;
		
		#20
		//Multiply
		a = 3;
		b = 4;
		op = 4;
		
		#20
		//Multiply
		a = -3;
		b = 4;
		op = 4;
		#20
		//Multiply
		a = 3;
		b = -4;
		op = 4;
		#20
		//Multiply
		a = -3;
		b = -4;
		op = 4;
		#20
		//Divide
		a = 24;
		b = 12;
		op = 5;
		
		#20
		//Shift Right
		a = 4;
		b = 2;
		op = 6;
		
		#20
		//Shift Right Arithmetic
		a = 8;
		b = 2;
		op = 7;
		
		#20
		//Shift Left
		a = 4;
		b = 1;
		op = 8;
		
		#20
		//Rotate Right
		a = -4;
		op = 9;
		
		#20
		//Rotate Left
		a = 4;
		op = 10;
		
		#20
		//Neg
		a = -8;
		op = 11;
		
		#20
		//Not
		a = 4;
		b = 0;
		op = 12;
		
		#20
		op = 0;
		
	end
	
endmodule 