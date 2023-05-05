`timescale 1ns/1ns
module alu_1bit(in0, in1, cin, cout, out, signal, binvert, reset);
  input in0, in1, cin, binvert, reset;
  output cout, out; 
  input [5:0] signal;
  wire temp_cout, temp_out;     
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
  
  // store at 0 if add
  full_adder fa(.in0(in0), .in1(binvert ^ in1), .cin(cin), .out(temp_out), .cout(temp_cout) );        
  
  
  assign out = ( reset == 1'b1 )                  ? 0 :
               ( signal == AND )                  ? ( in0 & in1 ) :  
               ( signal == OR )                   ? ( in0 | in1 ) :
               ( signal == SUB || signal == ADD ) ? temp_out : 
               ( signal == SLT && in0 > in1 ) ? 1'b1 : 1'b0;

  assign cout = (signal == SUB || signal == ADD ) ? temp_cout : (reset == 1'b1) ? 0 : 0; 
               
endmodule