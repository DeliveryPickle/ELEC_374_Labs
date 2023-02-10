module ALU(input wire [31:0] a, b, input wire [3:0] op, output reg [63:0] result);
	integer i = 0;
	integer prev = 0;
	reg [63:0] temp = 0;
	integer c = 0;
	reg [31:0] r = 0;
	
	function [63:0] add;
		input [31:0] a,b;
		begin
			add = 0;
			c = 0;
			i = 0;
			for (i = 0; i <= 31; i = i+1) begin
				add[i] = a[i]^b[i]^c;
				c = (a[i]&b[i])||(a[i]&c)||(b[i]&c);
			end
		end
	endfunction
	
	function [63:0] sub;
		input [31:0] a,b;
		begin
			sub = 0;
			b = neg(b);
			sub = add(a,b);
		end
	endfunction
	
	function [63:0] div;
		input [31:0] a,b;
		begin
			div = a;
			for (i = 0; i <= 31; i = i+1) begin
				div = div << 1;
				r = div[63:32] - b;
				if (r[31] == 1) //restore
					r = r+b;
				else //dont restore
					div[0] = 1;
				div = {r, div[31:0]};
			end
		end
	endfunction
	
	function [63:0] mul;
		input [31:0] a,b;
		begin
			temp = 0;
			prev = 0;
			mul = 0;
			for (i = 0; i <= 31; i = i+2) begin
				temp = b << i;
				if (a[i+1] == 0 && a[i] == 1&& prev == 1) begin //2
					temp = temp << 1;
					mul = mul+temp;
				end
				else if (a[i+1] == 1 && a[i] == 0 && prev == 0) begin //-2
					temp = temp << 1;
					mul = mul-temp;
				end
				else if ((a[i+1] == 0 && a[i] == 0 && prev == 1)||(a[i+1] == 0 && a[i] == 1&& prev == 0)) // 1
					mul = mul+temp;
				else if ((a[i+1] == 1 && a[i] == 0 && prev == 1)||(a[i+1] == 1 && a[i] == 1 && prev == 0)) //-1
					mul = mul-temp;
				prev = a[i];
				//nothing for bitwise = 0
			end
		end
	endfunction

	function integer land;
		input [31:0] a,b;
		begin
			land = (a && b);
		end
	endfunction
	
	function [63:0] lor;
		input [31:0] a,b;
		begin
			lor = (a || b);
		end
	endfunction
	
	function [31:0] neg;
		input [31:0] a;
		begin
			/*
			for (i = 0; i <= 31; i = i+1) begin
				if (a[i] == 0) 
					neg[i] = 1;
				else
					neg[i] = 0;
			end*/
			neg = a^32'hFFFFFFFF;
			neg = neg + 1;
		end
	endfunction
	
	function integer lnot;
		input [31:0] a;
		begin
			lnot = !a;
		end
	endfunction
	
	function [31:0] shiftL;
		input [31:0] a,b;
		begin
			shiftL = a << b;
		end
	endfunction
	/*
	function [31:0] shiftLA;
		input [31:0] a,b;
		begin
			shiftLA = a <<< b;
		end
	endfunction
	*/
	function [31:0] shiftR;
		input [31:0] a,b;
		begin
			shiftR = a >> b;
		end
	endfunction
	
		function [31:0] shiftRA;
		input [31:0] a,b;
		begin
			shiftRA = a >>> b;
		end
	endfunction
	
	function [31:0] ror;
		input [31:0] a;
		begin
			/*for (i=0; i>=b; i=i+1) begin
				integer temp = i[0];
				a = a >> 1;
				a[31] = temp;
			end*/
			c = i[0];
			a = a >> 1;
			a[31] = c;
			ror = a;
		end
	endfunction
	
	function [31:0] rol;
		input [31:0] a;
		begin
			/*for (i=0; i>=b; i=i+1) begin
				integer temp = i[31];
				a = a << 1;
				a[0] = temp;
			end*/
			c = i[31];
			a = a << 1;
			a[0] = c;
			rol = a;
		end
	endfunction
	
	always @*
		case(op)
		0	: result = land(a,b);
		1	: result = lor(a,b);
		2	: result = add(a,b);
		3	: result = sub(a,b);
		4	: result = mul(a,b);
		5	: result = div(a,b);
		6	: result = shiftR(a,b);
		7	: result = shiftRA(a,b);
		8	: result = shiftL(a,b);
		9	: result = ror(a);
		10	: result = rol(a);
		11	: result = neg(a);
		12	: result = lnot(a);
		default : result = land(a,b);
		endcase
endmodule
