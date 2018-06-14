logic [25:0] count; //Define um contador de 25 bits
logic NEW_CLOCK;
logic [4:0] contador = 0;
logic [7:0] contador2 = 0;

//Cria o novo clock com nova frequencia
always_comb begin
	NEW_CLOCK <= count[24];
	SEG[7] <= NEW_CLOCK;
end // always_comb

//Se a chave SWI[0] não estiver pra cima, o clock segue normal, senao trava
always_ff @ (posedge CLOCK_50) begin
	if (SWI[0] == 0) count <= count +1;
end // always_ff @ (posedge CLOCK_50)

always_ff @ (posedge NEW_CLOCK) begin

	case (contador)
		0: SEG[6:0] <= 'b0111111; //Numero 0
		1: SEG[6:0] <= 'b0000110; //Numero 1
		2: SEG[6:0] <= 'b1011011; //Numero 2
		3: SEG[6:0] <= 'b1001111; //Numero 3
		4: SEG[6:0] <= 'b1100110; //Numero 4
		5: SEG[6:0] <= 'b1101101; //Numero 5
		6: SEG[6:0] <= 'b1111101; //Numero 6
		7: SEG[6:0] <= 'b0000111; //Numero 7
		8: SEG[6:0] <= 'b1111111; //Numero 8
		9: SEG[6:0] <= 'b1101111; //Numero 9
	   10: SEG[6:0] <= 'b1110111; //Numero 10
	   11: SEG[6:0] <= 'b1111100; //Numero 11
	   12: SEG[6:0] <= 'b0111001; //Numero 12
	   13: SEG[6:0] <= 'b1011110; //Numero 13
	   14: SEG[6:0] <= 'b1111001; //Numero 14
	   15: SEG[6:0] <= 'b1110001; //Numero 15
	   default: SEG[6:0] <= 'b0000000;
	endcase // contador

	contador <= contador+1;

	if (contador == 15) contador <= 0;
	else contador <= contador + 1;

	contador2 <= contador2 + 1;
	
end // always_ff @ (posedge NEW_CLOCK)