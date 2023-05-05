module full_adder(in0, in1, cin, out, cout); 

  input in0, in1, cin; 
  output cout,out;  

  assign out = in0 ^ in1 ^ cin; 
  assign cout = (( in0 ^ in1 ) & cin) | (in0 & in1 );

endmodule 
