`timescale 1ns/1ns
module mux_4to1(AND_IN, OR_IN, OUT_IN, Signal, dataOut, Less, Reset );

input AND_IN, OR_IN, OUT_IN, Less, Reset; 
input [5:0] Signal;
output dataOut;


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SRL = 6'b000010;
parameter MULTU= 6'b011001;

assign dataOut = (Reset == 1'b1 ) ? 1'b0 : 
                 (Signal == AND ) ? AND_IN :
                 (Signal == OR ) ? OR_IN : 
                 (Signal == ADD || Signal == SUB) ? OUT_IN : 
                 (Signal == SLT ) ? Less : 1'b0;  
                 


 
endmodule