module step_motor(clk,clk_A0,clk_A1,clk_B0,clk_B1);//文件名保存要与module名保持一致
input clk;//时钟线
output reg clk_A0,clk_A1,clk_B0,clk_B1;//两相四线，A+,A-,B+,B-

parameter step_max=8;//八拍
reg[3:0]step;//实时步数，4bit

always@(posedge clk)//进步
begin
	step<=0;
	if(step==step_max-1)
	begin
		step<=0;//步数进至最大，清零
	end
	else
	begin
		step<=step+1;//步数未进至最大，进步
	end
end
//1 1 0 0 0 0 0 1
always@(posedge clk)//clk_A0(A+)
begin
	case(step)
	3'b000:clk_A0<=1;
	3'b010:clk_A0<=!clk_A0;
	3'b111:clk_A0<=!clk_A0;
	default:clk_A0<=clk_A0;
	endcase
end
//0 0 0 1 1 1 0 0
always@(posedge clk)//clk_A1(A-)
begin
	case(step)
	3'b000:clk_A1<=0;
	3'b011:clk_A1<=!clk_A1;
	3'b110:clk_A1<=!clk_A1;
	default:clk_A1<=clk_A1;
	endcase
end
//0 1 1 1 0 0 0 0
always@(posedge clk)//clk_B0(B+)
begin
	case(step)
	3'b000:clk_B0<=0;
	3'b001:clk_B0<=!clk_B0;
	3'b100:clk_B0<=!clk_B0;
	default:clk_B0<=clk_B0;
	endcase
end
//0 0 0 0 0 1 1 1
always@(posedge clk)//clk_B1(B-)
begin
	case(step)
	3'b000:clk_B1<=0;
	3'b101:clk_B1<=!clk_B1;
	default:clk_B1<=clk_B1;
	endcase
end
endmodule
