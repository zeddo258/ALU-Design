`timescale 1ns/1ns
module MULTU( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset;
input [31:0] dataA;  // 乘數
input [31:0] dataB;  // 被乘數
input [5:0] Signal;
output [63:0] dataOut;

reg [63:0] dataOut;
reg [31:0] MPY;   // 乘數暫存器
reg [63:0] MCND;  // 被乘數暫存器
reg [63:0] PROD;  // 積暫存器

parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;


// 初始化一些值
always@(Signal)
begin
if (Signal == MULTU)
begin
    MCND <= {32'h00000000, dataB[31:0]};
    MPY <= dataA;
    PROD <= 32'b0;
end
end

always@(posedge clk or reset)

begin
    if(reset)
    begin
        PROD <= 32'b0;
    end

    else
    begin
        PROD <= PROD;  // 好像一定要有寫else
    end

    if(MPY[0] == 1'b1)
    begin
        PROD <= MCND + PROD;
    end

    else
    begin
        PROD <= PROD;
    end

    MCND <= MCND << 1;
    MPY <= MPY >> 1;
    dataOut = PROD;

end

endmodule