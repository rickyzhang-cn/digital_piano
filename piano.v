`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:24 06/24/2013 
// Design Name: 
// Module Name:    piano 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//piano子模块
module piano(inclk, clk_5MHz, start, reset, ps2_clk, ps2_data, record, replay, 
				hsync, vsync, vga_r, vga_g, vga_b, beep, anodes, cathodes);

input  inclk;
input  clk_5MHz;
input  start, reset;
input  ps2_clk, ps2_data;
input  record, replay;
output beep;  
output [3:0] anodes;
output [6:0] cathodes;
// FPGA与VGA接口信号
output hsync;	//行同步信号
output vsync;	//场同步信号
output[2:0] vga_r;
output[2:0] vga_g;
output[1:0] vga_b;                              

wire [7:0] key_out;
wire carry;
//wire [13:0] led;
reg beep_r;
reg [13:0] count;
reg [13:0] origin;	
	
assign beep = beep_r;					     //输出音乐
//assign led = origin;

keyboard m1(.sys_clk(clk_5MHz), .k_clock(ps2_clk), .k_data(ps2_data), .record(record), .replay(replay), .out(key_out));
display m2(.clk(clk_5MHz), .origin(origin), .anodes(anodes), .cathodes(cathodes));
VGA m3(.inclk(inclk), .clk_5MHz(clk_5MHz), .reset(reset), .origin(origin), 
		.hsync(hsync), .vsync(vsync), .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b));
/*****************************************************************************/
always @ (posedge clk_5MHz)
	begin
		case (key_out[7:0])  
			8'h51: origin<=6826;   //Q Hdo
			8'h57: origin<=7871;   //W Hre
			8'h45: origin<=8798;   //E Hmi
			8'h52: origin<=9224;   //R Hfa
			8'h54: origin<=10005;   //T Hso
			8'h59: origin<=10701;   //Y Hla
			8'h55: origin<=11321;   //U Hsi
			//8'h43: count_end <= 8'h49;   //I
			//8'h44: count_end <= 8'h4f;   //O
			//8'h4d: count_end <= 8'h50;   //P               
			
			8'h41: origin<=11606;   //A Mdo
			8'h53: origin<=12126;   //S Mre
			8'h44: origin<=12591;   //D Mmi
			8'h46: origin<=12804;   //F Mfa
			8'h47: origin<=13194;   //G Mso
			8'h48: origin<=13524;   //H Mla
			8'h4a: origin<=13852;   //J Msi
			//8'h42: key_outt <= 7'b1111110;   //K
			//8'h4b: key_out <= 7'b1111110;   //L
			
			8'h5a: origin<=13994;   //Z Ldo
			8'h58: origin<=14255;   //X Lre
			8'h43: origin<=14487;   //C Lmi
			8'h56: origin<=14593;   //V Lfa
			8'h42: origin<=14789;   //B Lso
			8'h4e: origin<=14963;   //N Lla
			8'h4d: origin<=15117;   //M Lsi
			
			default: origin<=16383;
		endcase
	end	

assign carry=(count == 16383);

always @(posedge clk_5MHz)
begin  
	if(carry) 
		count = origin;
	else 
		count = count + 1;
end 

always @(posedge carry)
begin 
	beep_r<=~beep_r;
end 

endmodule
