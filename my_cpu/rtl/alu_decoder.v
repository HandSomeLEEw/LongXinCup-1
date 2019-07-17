`timescale 1ns / 1ps

// Create Date: 2019/06/21 16:14:50

`include "aludefines.vh"
`include "defines.vh"

module alu_decoder(
	input [5:0] op_code,
	input [5:0] funct,
	output reg [4:0] alu_control
    );
	
	always @* begin
		case(op_code)
			//R-TYPE
			`EXE_R_TYPE: 
					case(funct)
						`EXE_ADD:   	alu_control <= `ALU_ADD;
						`EXE_SUB:   	alu_control <= `ALU_SUB;
						`EXE_AND:   	alu_control <= `ALU_AND;
						`EXE_OR:    	alu_control <= `ALU_OR;
						`EXE_SLT:   	alu_control <= `ALU_SLT;
						`EXE_SLL:   	alu_control <= `ALU_SLL;
						`EXE_SRL:   	alu_control <= `ALU_SRL;
						`EXE_SRA:   	alu_control <= `ALU_SRA;
						`EXE_SLLV:  	alu_control <= `ALU_SLL;
						`EXE_SRLV:  	alu_control <= `ALU_SRL;
						`EXE_SRAV:  	alu_control <= `ALU_SRA;
						`EXE_XOR:   	alu_control <= `ALU_XOR;
						`EXE_NOR:   	alu_control <= `ALU_NOR;
						`EXE_ADDU:  	alu_control <= `ALU_ADDU;
						`EXE_SUBU:  	alu_control <= `ALU_SUBU;
						`EXE_SLTU:  	alu_control <= `ALU_SLTU;
						`EXE_MFHI:  	alu_control <= `ALU_MFHI;
						`EXE_MFLO:  	alu_control <= `ALU_MFLO;
						`EXE_MTHI:  	alu_control <= `ALU_MTHI;
						`EXE_MTLO:  	alu_control <= `ALU_MTLO;
						`EXE_DIV:   	alu_control <= `ALU_SIGNED_DIV;
						`EXE_DIVU:  	alu_control <= `ALU_UNSIGNED_DIV;
						`EXE_MULT:  	alu_control <= `ALU_SIGNED_MULT;
						`EXE_MULTU: 	alu_control <= `ALU_UNSIGNED_MULT;
						default:    	alu_control <= `ALU_ADDU;
					endcase

			`EXE_LW,`EXE_SW,`EXE_BEQ,`EXE_J: 		
										alu_control <= `ALU_DONOTHING;

			//I-TYPE
			`EXE_ADDI: 		
										alu_control <= `ALU_ADD;
			`EXE_ADDIU:
										alu_control <= `ALU_ADDU;
			`EXE_SLTI:
										alu_control <= `ALU_SLT;
			`EXE_SLTIU:
										alu_control <= `ALU_SLTU;
			`EXE_ANDI:
										alu_control <= `ALU_AND;
			`EXE_ORI:			
										alu_control <= `ALU_OR;
			`EXE_XORI:
										alu_control <= `ALU_XOR;
			`EXE_LUI:
										alu_control <= `ALU_LUI;
			
			//MOVE INST
			`EXE_MTHI:					alu_control <= `ALU_MTHI;
			default:
										alu_control <= `ALU_DONOTHING;
		endcase
	end
endmodule
