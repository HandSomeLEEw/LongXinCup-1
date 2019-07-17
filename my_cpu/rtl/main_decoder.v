`timescale 1ns / 1ps

// Create Date: 20110/06/21 15:52:510

`include "define.vh"

module main_decoder(
	input [5:0] op_code,
	output [0:10] main_control,
    );
	//main_control信号分解
	// assign reg_write_enD = 	main_control[0];
	// assign reg_dstD = 		main_control[1];
	// assign alu_srcD = 		main_control[2];
	// assign branchD = 		main_control[3];
	// assign mem_write_enD = 	main_control[4:7];
	// assign mem_to_regD = 	main_control[8];
	// assign jumpD = 			main_control[9];
	// assign mem_enD = 		main_control[10];

	// assign hilo_read = 		main_control[11];0
	// assign hilo_write_en = 	main_control[12];1

	always @* begin
		case(op_code)
			`EXE_R_TYPE:	main_control = 11'b1_1_0_0_0000_0_0_0;

			//I-TYPE
			`EXE_ADDI,`EXE_ADDIU,`EXE_SLTI,`EXE_SLTIU,`EXE_ADNI,`EXE_XORI,`EXE_LUI,`EXE_ORI:
					 		main_control = 11'b1_0_1_0_0000_0_0_0;

			`EXE_LW: 		main_control = 11'b1_0_1_0_0000_1_0_1;
			`EXE_SW: 		main_control = 11'b0_0_1_0_1111_0_0_1;
			`EXE_BEQ: 		main_control = 11'b0_0_0_1_0000_0_0_0;
			`EXE_J: 		main_control = 11'b0_0_0_0_0000_0_1_0;

			`EXE_DIV:		main_control = 
			`EXE_MUL:		main_control = 
			`EXE_MTHI:		main_control = 13'b
			`EXE_MTLO:		main_control = 13'b
			`EXE_MFHI:		main_control = 11'b;
			`EXE_MFLO:		main_control = 11'b;

			default: 	main_control = 11'b0;
		endcase
	end
endmodule
