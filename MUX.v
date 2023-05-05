`timescale 1ns/1ns
module MUX(ALUOut, HiOut, LoOut, Shifter, Signal, dataOut);
input [31:0] ALUOut;
input [31:0] HiOut;
input [31:0] LoOut;
input [31:0] Shifter;
input [5:0] Signal;
output [31:0] dataOut;

/*
parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SRL = 6'b000010;
parameter MULTU= 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
*/

assign dataOut = (Signal == 6'b100100) ? ALUOut:
                 (Signal == 6'b100101) ? ALUOut:
                 (Signal == 6'b100000) ? ALUOut:
                 (Signal == 6'b100010) ? ALUOut:
                 (Signal == 6'b101010) ? ALUOut:
                 (Signal == 6'b010000) ? HiOut:
                 (Signal == 6'b010010) ? LoOut:
                 (Signal == 6'b000010) ? Shifter:
                 32'b0;                              // default

endmodule