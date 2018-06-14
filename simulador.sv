// DESCRIPTION: Verilator: Systemverilog example module
// with interface to switch buttons, LEDs, LCD and register display
/* verilator lint_off COMBDLY */
/* verilator lint_off WIDTH */

parameter NINSTR_BITS = 32;
parameter NBITS_TOP = 8, NREGS_TOP = 32;
module top(input  logic clk_2,
           input  logic [NBITS_TOP-1:0] SWI,
           output logic [NBITS_TOP-1:0] LED,
           output logic [NBITS_TOP-1:0] SEG,
           output logic [NINSTR_BITS-1:0] lcd_instruction,
           output logic [NBITS_TOP-1:0] lcd_registrador [0:NREGS_TOP-1],
           output logic [NBITS_TOP-1:0] lcd_pc, lcd_SrcA, lcd_SrcB,
             lcd_ALUResult, lcd_Result, lcd_WriteData, lcd_ReadData, 
           output logic lcd_MemWrite, lcd_Branch, lcd_MemtoReg, lcd_RegWrite);
/*
  always_comb begin
    LED <= SWI;
    SEG <= SWI;
    lcd_WriteData <= SWI;
    lcd_pc <= 'h12;
    lcd_instruction <= 'h34567890;
    lcd_SrcA <= 'hab;
    lcd_SrcB <= 'hcd;
    lcd_ALUResult <= 'hef;
    lcd_Result <= 'h11;
    lcd_ReadData <= 'h33;
    lcd_MemWrite <= SWI[0];
    lcd_Branch <= SWI[1];
    lcd_MemtoReg <= SWI[2];
    lcd_RegWrite <= SWI[3];
    for(int i=0; i<NREGS_TOP; i++) lcd_registrador[i] <= i+i*16;
  end
  */
  
logic [3:0] counter;

always_ff @(posedge clk_2 ) begin
     	counter <= counter + 1;
	$display("counter: HEX|DEC");
	$display("counter: %0h %3d", counter, counter);
	unique case(counter)
		0: SEG[7:0] <= 'b10111111;
		1: SEG[7:0] <= 'b00000110;
		2: SEG[7:0] <= 'b11011011;
		3: SEG[7:0] <= 'b01001111;
		4: SEG[7:0] <= 'b11100110;
		5: SEG[7:0] <= 'b01101101;
		6: SEG[7:0] <= 'b11111101;
		7: SEG[7:0] <= 'b00000111;
		8: SEG[7:0] <= 'b11111111;
		9: SEG[7:0] <= 'b01101111;
		10: SEG[7:0] <= 'b11110111;
		11: SEG[7:0] <= 'b01111100;
		12: SEG[7:0] <= 'b10111001;
		13: SEG[7:0] <= 'b01011110;
		14: SEG[7:0] <= 'b11111001;
		15: SEG[7:0] <= 'b01110001;
	endcase
	if(counter==15) counter<=0;
end

endmodule
