module eightbit_palu(input signed[7:0]a, input signed[7:0]b, input[1:0]sel, output[7:0]f, output ovf);
	wire [7:0] w;
	wire [7:0] x;
	wire [7:0] y;
	wire [7:0] z;
	reg [7:0] f;
	reg ovf;

	assign w = a + b;
	assign x =  ~b;
	assign y = a & b;
	assign z = a | b;

	always @(sel)
		case(sel)
			2'b00: begin
				assign f =w;
				ovf = (a[7] & b[7] & ~f[7]) | (~a[7] & ~b[7] & f[7]);
				end
			2'b01: begin
				assign f=x;
				ovf = 0;
				end
			2'b10: begin
				assign f = y;
				ovf = 0;
				end
			2'b11: begin
				assign f = z;
				ovf = 0;
				end
			default: begin
				f=0;
				ovf = 0;
				end
		endcase
endmodule
			
