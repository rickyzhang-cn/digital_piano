`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:55 06/25/2013 
// Design Name: 
// Module Name:    song3 
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

//song3子模块《天空之城》
module song3(clk_5MHz,clk_4Hz,beep);
	
input clk_5MHz,clk_4Hz;				       //系统时钟,50Mhz
output beep;					   //蜂鸣器输出端

reg  [3:0]high,med,low;
reg  [15:0]origin;
reg	beep_r;					   //寄存器
reg  [7:0]state;					   
reg  [15:0]count;			

assign beep = beep_r;	          //输出音乐

always @(posedge clk_5MHz)
begin
	count <= count + 1'b1;					  //计数器加1
	if(count == origin)
	begin
		count <= 16'h0;					      //计数器清零
		beep_r <= !beep_r;				      //输出取反
	end
end

always@(posedge clk_4Hz)
begin
	case({high,med,low})
		'b000000000001:origin=22900; //低1
		'b000000000010:origin=20408; //低2
		'b000000000011:origin=18181; //低3
		'b000000000100:origin=17142; //低4
		'b000000000101:origin=15267; //低5
		'b000000000110:origin=13605; //低6
		'b000000000111:origin=12121; //低7
		'b000000010000:origin=11472; //中1
		'b000000100000:origin=10216; //中2
		'b000000110000:origin=9101;  //中3
		'b000000111000:origin=8571;  //中4
		'b000001010000:origin=7653;  //中5
		'b000001100000:origin=6818;  //中6
		'b000010000000:origin=6060;  //中7
		'b000100000000:origin=5733;  //高1
		'b001000000000:origin=5108;  //高2
		'b001100000000:origin=4551;  //高3
		'b001010000000:origin=4294;  //高4
		'b010000000000:origin=3826;  //高5
		'b011000000000:origin=3409;  //高6
		'b010100000000:origin=3050;  //高7
	endcase
end


always @(posedge clk_4Hz)	
begin
	if(state ==195)
		state = 0;
	else
		state = state + 1'b1; 
	case(state)
		0:								{high,med,low}='b000001100000;//中6
		1:					    		{high,med,low}='b000010000000;//中7
		2,3,4:						{high,med,low}='b000100000000;//高1
		5:								{high,med,low}='b000010000000;//中7
		6,7:                		{high,med,low}='b000100000000;//高1
		8,9:							{high,med,low}='b001100000000;//高3
		10,11,12,13,14,15:				            
										{high,med,low}='b000010000000;//中7
		16,17:            		{high,med,low}='b000000110000;//中3
		18,19,20:					{high,med,low}='b000001100000;//中6
		21:		 					{high,med,low}='b000001010000;//中5
		22,23:              	 	{high,med,low}='b000001100000;//中6
		24,25:						{high,med,low}='b000000000111;//中1
		26,27,28,29,30,31:
										{high,med,low}='b000001010000;//中5   							
		32:				       	{high,med,low}='b000000110000;//中3
		33:			          	{high,med,low}='b000000110000;//中3
		
		34,35,36:				 	{high,med,low}='b000000111000;//中4
		37:					    	{high,med,low}='b000000110000;//中3
		38:					    	{high,med,low}='b000000111000;//中4
		39,40,41:				 	{high,med,low}='b000100000000;//高1
		42,43,44:             	{high,med,low}='b000000110000;//中3
		45,46,47:			    	{high,med,low}='b000100000000;//高1
		48,49,50:		       	{high,med,low}='b000010000000;//中7
		51,52,53:             	{high,med,low}='b000000111000;//中4
		54,55,56,57,58,59,60,61:
										{high,med,low}='b000010000000;//中7
		62:					    	{high,med,low}='b000001100000;//中6
		63:				       	{high,med,low}='b000010000000;//中7
		
		64,65,66:	          	{high,med,low}='b000100000000;//高1
		67:					    	{high,med,low}='b010100000000;//高7
		68,69:			       	{high,med,low}='b000100000000;//高1
		70,71:			       	{high,med,low}='b001100000000;//高3
		72,73,74:				 	{high,med,low}='b000010000000;//中7
		75,76:			       	{high,med,low}='b000000110000;//中3
		77,78,79:    			 	{high,med,low}='b000001100000;//中6
		80:					    	{high,med,low}='b000000000101;//中5
		81,82:			       	{high,med,low}='b000001100000;//中6			
		83,84:                	{high,med,low}='b000000000111;//中1
		85,86,87,88,89,90:	 	{high,med,low}='b000001010000;//中5   							
		91:				       	{high,med,low}='b000000110000;//中3
		92:			          	{high,med,low}='b000000110000;//中3
		
		93,94:			 		 	{high,med,low}='b000000111000;//中4 
		95:					    	{high,med,low}='b000100000000;//高1
		96,97,98:				 	{high,med,low}='b000010000000;//中7
		99,100:					 	{high,med,low}='b000100000000;//高1
		101,102:					 	{high,med,low}='b001000000000;//高2
		103:						 	{high,med,low}='b001100000000;//高3
		104,105,106,107,108,109:	
										{high,med,low}='b000100000000;//高1
		110:		             	{high,med,low}='b000010000000;//中7			
		111,112:					 	{high,med,low}='b000001100000;//中6
		113,114:					 	{high,med,low}='b000010000000;//中7
		115,116:					 	{high,med,low}='b000001010000;//中5
		117,118,119,120,121,122:			
										{high,med,low}='b000001100000;//中6
		123,124:					 	{high,med,low}='b000000000111;//中1
		125:						 	{high,med,low}='b001000000000;//高2
		
		126,127,128:    			{high,med,low}='b001100000000;//高3
		129:							{high,med,low}='b001000000000;//高2
		130,131:						{high,med,low}='b001100000000;//高3			
		132,133:            		{high,med,low}='b010000000000;//高5
		134,135,136,137,138,139:	
										{high,med,low}='b001000000000;//高2
		140,141:						{high,med,low}='b000001010000;//中5
		142,143,144:    			{high,med,low}='b000100000000;//高1
		145:							{high,med,low}='b000010000000;//中7
		146,147:						{high,med,low}='b000100000000;//高1
		148,149,150,151,152,153,154,155:			
										{high,med,low}='b001100000000;//高3
										
		156,157:						{high,med,low}='b000001100000;//中6
		158,159:						{high,med,low}='b000010000000;//中7			
		160,161,162,163:			
										{high,med,low}='b000100000000;//高1
		164,165:						{high,med,low}='b000010000000;//中7
		166,167:						{high,med,low}='b000100000000;//高1
		168,169:						{high,med,low}='b001000000000;//高2
		170,171,172:				{high,med,low}='b000100000000;//高1	
		173,174,175,176,177,178:		
										{high,med,low}='b000001010000;//中5
		179,180:						{high,med,low}='b001010000000;//高4
		181,182:						{high,med,low}='b001100000000;//高3								
		183,184,185:				{high,med,low}='b001000000000;//高2
		186,187:						{high,med,low}='b000100000000;//高1
		188,189,190,191,192,193,194,195:			
										{high,med,low}='b001100000000;//高3	
	endcase
end

endmodule
