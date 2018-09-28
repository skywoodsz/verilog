`timescale 1ns/1ps//定义时间单位/时间精度
`define clock_period 20
module step_motor_test_tb;
//定义输出与输入
reg clk;
wire clk_A0;
wire clk_A1;
wire clk_B0;
wire clk_B1;

step_motor_test(
.clk50M(clk),//def 外部时钟晶振
.clk_A0(clk_A0),//def 使能I/O口
.clk_A1(clk_A1),
.clk_B0(clk_B0),
.clk_B1(clk_B1)
);


endmodule
