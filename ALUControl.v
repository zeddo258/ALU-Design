`timescale 1ns/1ns
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX );
input clk ;
input [5:0] Signal;
output [5:0] SignaltoALU;
output [5:0] SignaltoSHT;
output [5:0] SignaltoMULTU;
output [5:0] SignaltoMUX;


reg [5:0] tmp;
reg [6:0] counter; // 數32次，乘法要做32次


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;

parameter MULTU= 6'b011001;  // 這個我有改 25
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;


always@(Signal)
begin
// 重製計數器
  if (Signal == MULTU)
  begin
    counter = 0;
  end
end

always@(posedge clk)
begin
  tmp = Signal;
  if (Signal == MULTU)
  begin
    counter = counter + 1;
    if (counter == 32)
    begin
    // 做32次就呼叫HiLo把值丟進去
      counter = 0;
    end
  end
end

assign SignaltoALU = tmp;
assign SignaltoSHT = tmp;
assign SignaltoMULTU = tmp;
assign SignaltoMUX = tmp;

endmodule