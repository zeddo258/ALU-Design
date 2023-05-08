`timescale 1ns/1ns
module alu_1bit_set(in0, in1, cin, cout, out, signal, binvert, reset, less, set);
  input in0, in1, cin, binvert, reset, less; 
  output cout, out, set; 
  input [5:0] signal;
  wire temp_cout, temp_out;   
  wire temp_and, temp_or;   
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
  and(temp_and, in0, in1); 
  or(temp_or, in0, in1); 
  full_adder fa(.in0(in0), .in1(binvert ^ in1), .cin(cin), .out(temp_out), .cout(temp_cout) );        
  mux_4to1 m1(.AND_IN(temp_and), .OR_IN(temp_or), .OUT_IN(temp_out), .Signal(signal), .dataOut(out), .Reset(reset), .Less(less) );
  assign cout = (signal == SUB || signal == ADD ) ? temp_cout : (reset == 1'b1) ? 0 : 0; 
  assign set = (out == 1'b1 ) ? 1'b1 : 1'b0; // result in overflown
endmodule
