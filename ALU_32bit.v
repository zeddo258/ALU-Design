`timescale 1ns/1ns

module alu_32bits(in0, in1, out, signal, binvert, reset); 
  input [31:0] in0, in1; 
  input [5:0] signal;
  input binvert, reset; 
  output [31:0] out;
  wire [31:0] c, temp_out, temp_out_2, c1; 
  wire set;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SRL = 6'b000010;
parameter MULTU= 6'b011001;

  // Subtract first for SLT
  alu_1bit alu0( .in0(in0[0]), .in1(in1[0]), .cin(1'b1), .out(temp_out[0]), .cout(c1[0]), .signal(SUB), .binvert(1'b1), .reset(reset), .less(1'b0) ); 
  alu_1bit alu1( .in0(in0[1]), .in1(in1[1]), .cin(c1[0]), .out(temp_out[1]), .cout(c1[1]), .signal(SUB), .binvert(1'b1), .reset(reset), .less(1'b0) ); 
  alu_1bit alu2( .in0(in0[2]), .in1(in1[2]), .cin(c1[1]), .out(temp_out[2]), .cout(c1[2]), .signal(SUB), .binvert(1'b1), .reset(reset), .less(1'b0) ); 
  alu_1bit alu3( .in0(in0[3]), .in1(in1[3]), .cin(c1[2]), .out(temp_out[3]), .cout(c1[3]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu4( .in0(in0[4]), .in1(in1[4]), .cin(c1[3]), .out(temp_out[4]), .cout(c1[4]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu5( .in0(in0[5]), .in1(in1[5]), .cin(c1[4]), .out(temp_out[5]), .cout(c1[5]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu6( .in0(in0[6]), .in1(in1[6]), .cin(c1[5]), .out(temp_out[6]), .cout(c1[6]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu7( .in0(in0[7]), .in1(in1[7]), .cin(c1[6]), .out(temp_out[7]), .cout(c1[7]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu8( .in0(in0[8]), .in1(in1[8]), .cin(c1[7]), .out(temp_out[8]), .cout(c1[8]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu9( .in0(in0[9]), .in1(in1[9]), .cin(c1[8]), .out(temp_out[9]), .cout(c1[9]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu10( .in0(in0[10]), .in1(in1[10]), .cin(c1[9]), .out(temp_out[10]), .cout(c1[10]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu11( .in0(in0[11]), .in1(in1[11]), .cin(c1[10]), .out(temp_out[11]), .cout(c1[11]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu12( .in0(in0[12]), .in1(in1[12]), .cin(c1[11]), .out(temp_out[12]), .cout(c1[12]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu13( .in0(in0[13]), .in1(in1[13]), .cin(c1[12]), .out(temp_out[13]), .cout(c1[13]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu14( .in0(in0[14]), .in1(in1[14]), .cin(c1[13]), .out(temp_out[14]), .cout(c1[14]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu15( .in0(in0[15]), .in1(in1[15]), .cin(c1[14]), .out(temp_out[15]), .cout(c1[15]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu16( .in0(in0[16]), .in1(in1[16]), .cin(c1[15]), .out(temp_out[16]), .cout(c1[16]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu17( .in0(in0[17]), .in1(in1[17]), .cin(c1[16]), .out(temp_out[17]), .cout(c1[17]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu18( .in0(in0[18]), .in1(in1[18]), .cin(c1[17]), .out(temp_out[18]), .cout(c1[18]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu19( .in0(in0[19]), .in1(in1[19]), .cin(c1[18]), .out(temp_out[19]), .cout(c1[19]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu20( .in0(in0[20]), .in1(in1[20]), .cin(c1[19]), .out(temp_out[20]), .cout(c1[20]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu21( .in0(in0[21]), .in1(in1[21]), .cin(c1[20]), .out(temp_out[21]), .cout(c1[21]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu22( .in0(in0[22]), .in1(in1[22]), .cin(c1[21]), .out(temp_out[22]), .cout(c1[22]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu23( .in0(in0[23]), .in1(in1[23]), .cin(c1[22]), .out(temp_out[23]), .cout(c1[23]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit alu24( .in0(in0[24]), .in1(in1[24]), .cin(c1[23]), .out(temp_out[24]), .cout(c1[24]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) ); 
  alu_1bit alu25( .in0(in0[25]), .in1(in1[25]), .cin(c1[24]), .out(temp_out[25]), .cout(c1[25]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit alu26( .in0(in0[26]), .in1(in1[26]), .cin(c1[25]), .out(temp_out[26]), .cout(c1[26]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit alu27( .in0(in0[27]), .in1(in1[27]), .cin(c1[26]), .out(temp_out[27]), .cout(c1[27]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit alu28( .in0(in0[28]), .in1(in1[28]), .cin(c1[27]), .out(temp_out[28]), .cout(c1[28]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit alu29( .in0(in0[29]), .in1(in1[29]), .cin(c1[28]), .out(temp_out[29]), .cout(c1[29]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit alu30( .in0(in0[30]), .in1(in1[30]), .cin(c1[29]), .out(temp_out[30]), .cout(c1[30]), .signal(SUB), .binvert(1'b1), .reset(reset),  .less(1'b0) );
  alu_1bit_set alu31( .in0(in0[31]), .in1(in1[31]), .cin(c1[30]), .out(temp_out[31]), .cout(c1[31]), .signal(SUB), .binvert(1'b1), .reset(reset), .set(set), .less(1'b0) );

  // second pass 
  alu_1bit alu01( .in0(in0[0]), .in1(in1[0]), .cin(binvert), .out(temp_out_2[0]), .cout(c[0]), .signal(signal), .binvert(binvert), .reset(reset), .less(set)); 
  alu_1bit alu1111( .in0(in0[1]), .in1(in1[1]), .cin(c[0]), .out(temp_out_2[1]), .cout(c[1]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu2222( .in0(in0[2]), .in1(in1[2]), .cin(c[1]), .out(temp_out_2[2]), .cout(c[2]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu33( .in0(in0[3]), .in1(in1[3]), .cin(c[2]), .out(temp_out_2[3]), .cout(c[3]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu44( .in0(in0[4]), .in1(in1[4]), .cin(c[3]), .out(temp_out_2[4]), .cout(c[4]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu55( .in0(in0[5]), .in1(in1[5]), .cin(c[4]), .out(temp_out_2[5]), .cout(c[5]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu66( .in0(in0[6]), .in1(in1[6]), .cin(c[5]), .out(temp_out_2[6]), .cout(c[6]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu77( .in0(in0[7]), .in1(in1[7]), .cin(c[6]), .out(temp_out_2[7]), .cout(c[7]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu88( .in0(in0[8]), .in1(in1[8]), .cin(c[7]), .out(temp_out_2[8]), .cout(c[8]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu99( .in0(in0[9]), .in1(in1[9]), .cin(c[8]), .out(temp_out_2[9]), .cout(c[9]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu100( .in0(in0[10]), .in1(in1[10]), .cin(c[9]), .out(temp_out_2[10]), .cout(c[10]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu111( .in0(in0[11]), .in1(in1[11]), .cin(c[10]), .out(temp_out_2[11]), .cout(c[11]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu122( .in0(in0[12]), .in1(in1[12]), .cin(c[11]), .out(temp_out_2[12]), .cout(c[12]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu133( .in0(in0[13]), .in1(in1[13]), .cin(c[12]), .out(temp_out_2[13]), .cout(c[13]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu144( .in0(in0[14]), .in1(in1[14]), .cin(c[13]), .out(temp_out_2[14]), .cout(c[14]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu155( .in0(in0[15]), .in1(in1[15]), .cin(c[14]), .out(temp_out_2[15]), .cout(c[15]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu166( .in0(in0[16]), .in1(in1[16]), .cin(c[15]), .out(temp_out_2[16]), .cout(c[16]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu177( .in0(in0[17]), .in1(in1[17]), .cin(c[16]), .out(temp_out_2[17]), .cout(c[17]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu188( .in0(in0[18]), .in1(in1[18]), .cin(c[17]), .out(temp_out_2[18]), .cout(c[18]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu199( .in0(in0[19]), .in1(in1[19]), .cin(c[18]), .out(temp_out_2[19]), .cout(c[19]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu200( .in0(in0[20]), .in1(in1[20]), .cin(c[19]), .out(temp_out_2[20]), .cout(c[20]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu211( .in0(in0[21]), .in1(in1[21]), .cin(c[20]), .out(temp_out_2[21]), .cout(c[21]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu222( .in0(in0[22]), .in1(in1[22]), .cin(c[21]), .out(temp_out_2[22]), .cout(c[22]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu233( .in0(in0[23]), .in1(in1[23]), .cin(c[22]), .out(temp_out_2[23]), .cout(c[23]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu244( .in0(in0[24]), .in1(in1[24]), .cin(c[23]), .out(temp_out_2[24]), .cout(c[24]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0)); 
  alu_1bit alu255( .in0(in0[25]), .in1(in1[25]), .cin(c[24]), .out(temp_out_2[25]), .cout(c[25]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu266( .in0(in0[26]), .in1(in1[26]), .cin(c[25]), .out(temp_out_2[26]), .cout(c[26]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu277( .in0(in0[27]), .in1(in1[27]), .cin(c[26]), .out(temp_out_2[27]), .cout(c[27]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu288( .in0(in0[28]), .in1(in1[28]), .cin(c[27]), .out(temp_out_2[28]), .cout(c[28]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu299( .in0(in0[29]), .in1(in1[29]), .cin(c[28]), .out(temp_out_2[29]), .cout(c[29]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu300( .in0(in0[30]), .in1(in1[30]), .cin(c[29]), .out(temp_out_2[30]), .cout(c[30]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));
  alu_1bit alu311( .in0(in0[31]), .in1(in1[31]), .cin(c[30]), .out(temp_out_2[31]), .cout(c[31]), .signal(signal), .binvert(binvert), .reset(reset), .less(1'b0));

  assign out = temp_out_2; 
endmodule

