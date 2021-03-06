module RegFile
(
	clock, 
	reset, 
	write_enable, 
	raddr1, 
	raddr2, 
	waddr, 
	wdata, 
	rdata1, 
	rdata2
);
	input clock;
	input reset;
	input write_enable;
	input [4:0]raddr1;
	input [4:0]raddr2;
	input [4:0]waddr;
	input [31:0]wdata;
	output [31:0]rdata1;
	output [31:0]rdata2;

	reg [31:0]memory[31:0];

	integer i;
	initial begin
		for(i = 0; i <= 31; i = i + 1) begin
			memory[i] = 32'b0;
		end
	end

	always @(negedge clock or posedge reset) begin
		if(reset) begin
			memory[0] <= 32'b0;
			memory[1] <= 32'b0;
			memory[2] <= 32'b0;
			memory[3] <= 32'b0;
			memory[4] <= 32'b0;
			memory[5] <= 32'b0;
			memory[6] <= 32'b0;
			memory[7] <= 32'b0;
			memory[8] <= 32'b0;
			memory[9] <= 32'b0;
			memory[10] <= 32'b0;
			memory[11] <= 32'b0;
			memory[12] <= 32'b0;
			memory[13] <= 32'b0;
			memory[14] <= 32'b0;
			memory[15] <= 32'b0;
			memory[16] <= 32'b0;
			memory[17] <= 32'b0;
			memory[18] <= 32'b0;
			memory[19] <= 32'b0;
			memory[20] <= 32'b0;
			memory[21] <= 32'b0;
			memory[22] <= 32'b0;
			memory[23] <= 32'b0;
			memory[24] <= 32'b0;
			memory[25] <= 32'b0;
			memory[26] <= 32'b0;
			memory[27] <= 32'b0;
			memory[28] <= 32'b0;
			memory[29] <= 32'b0;
			memory[30] <= 32'b0;
			memory[31] <= 32'b0;
		end 
		else begin
			if(write_enable && (waddr != 5'b0)) begin
				memory[waddr] <= wdata;
			end 
			else begin
				memory[waddr] <= memory[waddr];
			end
		end
	end

	assign rdata1 = memory[raddr1];
	assign rdata2 = memory[raddr2];
endmodule