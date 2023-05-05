`timescale 1ns/1ns
module TotalALU( clk, dataA, dataB, Signal, Output, reset, binvert );
input reset ;
input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
input binvert; 
output [31:0] Output ;

  /*
  Signal : 6-bit Value(Decimal)
  ---------------------
  AND : 36
  OR : 37
  ADD : 32
  SUB : 34
  SLT : 42
  SRL : 02
  MULTU : 25
  ---------------------
  */ 
  parameter AND = 6'b100100;
  parameter OR  = 6'b100101;
  parameter ADD = 6'b100000;
  parameter SUB = 6'b100010;
  parameter SLT = 6'b101010;
  parameter MULTU = 6'b011001; 
wire [31:0] temp ;


/*
定義各種訊號
*/
//============================
wire [5:0]  SignaltoALU ;
wire [5:0]  SignaltoSHT ;
wire [5:0]  SignaltoMULTU ;
wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] MulAns ;
/*
定義各種接線
*/
//============================

ALUControl ALUControl( .clk(clk), .Signal(Signal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMULTU(SignaltoMULTU), .SignaltoMUX(SignaltoMUX) );
assign binvert = ( SignaltoALU == SUB ) ? 1'b1 : 1'b0; 
alu_32bits ALU( .in0(dataA), .in1(dataB), .signal(SignaltoALU), .out(ALUOut), .reset(reset), .binvert(binvert) );
MULTU MULTU1( .clk(clk), .dataA(dataA), .dataB(dataB), .Signal(SignaltoMULTU), .dataOut(MulAns), .reset(reset) );
Shifter Shifter( .dataIn(dataA), .shamt(dataB), .signal(SignaltoSHT), .dataOut(ShifterOut), .reset(reset) );
HiLo HiLo( .clk(clk), .MulAns(MulAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
/*
建立各種module
*/
assign Output = dataOut ;


endmodule