//arquivo criado para o modulo fsm.sv

module fsm(input logic clock, reset, in, output logic out);
	enum logic [5:0] {espera, faca} state;

	always_ff @ (posedge clock) begin
		
		if (reset) state <= espera;

		else begin
			unique case (state)
				espera: if (...) state <= faca;
				faca: state <= faca;
			endcase // state
		end // else
	end // always_ff @ (posedge clock)
endmodule // fsm

//Aqui é o arquivo de0_nano.sv

`include "fsm.sv"
logic [25:0] count;
logic clock;

always_comb LED[0] <= count[24];

always_ff @ (posedge CLOCK_50) begin
	count <= count + 1;
	LED[7] <= clock;
end // always_ff @ (posedge CLOCK_50)

fsm f(clock, SWI[6], SWI[0], LED[7])