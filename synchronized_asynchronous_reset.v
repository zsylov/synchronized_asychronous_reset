module synchronized_asynchronous_reset(
				input clk,
				input reset_n,
				input input_a,
				output out_a
			);
			
		reg Reset1,Reset2;
		reg Buffer;
		
		assign out_a = Buffer;
		assign rst_n = Reset2;
		
	always @( posedge clk or negedge reset_n)
		if(!reset_n)
			begin
				Reset1 <= 1'b0;
				Reset2 <= 1'b1;
			end
		else begin
				Reset1 <= 1'b1;
				Reset2 <= Reset1;
			end
	
	always @ (posedge clk or negedge rst_n )
		if(!rst_n)
			begin
				Buffer <= 1'b0;
			end
		else
			begin
				Buffer <= input_a;
			end
			
endmodule
