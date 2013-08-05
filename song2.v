`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:20 06/25/2013 
// Design Name: 
// Module Name:    song2 
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

//song2子模块《康定情歌》
module song2(clk_5MHz,clk_4Hz,beep);
	
input	 clk_5MHz,clk_4Hz;				       //系统时钟,50Mhz
output beep;					   //蜂鸣器输出端

reg    [3:0] high, med, low;
reg    [15:0] origin;
reg	 beep_r;					   //寄存器
reg    [7:0] state;					   
reg    [15:0] count;			 

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
		'b000000000101:origin=15267; //低5
		'b000000000110:origin=13605; //低6
		'b000000010000:origin=11472; //中1
		'b000000100000:origin=10216; //中2
		'b000000110000:origin=9101;  //中3
		'b000001010000:origin=7653;  //中5
		'b000001100000:origin=6818;  //中6
		'b000100000000:origin=5733;  //高1
		'b001000000000:origin=5108;  //高2
		'b001100000000:origin=4551;  //高3
	endcase
end

always @(posedge clk_4Hz)	
begin
	if(state ==103) 
		state = 0;
	else
		state = state + 1'b1;                   //《康定情歌》
	case(state)
			0,1:			  		{high,med,low}='b000000110000;//中3
			2,3:			  		{high,med,low}='b000001010000;//中5
			4,5:			  		{high,med,low}='b000001100000;//中6
			6:				  		{high,med,low}='b000001100000;//中6
			7:                {high,med,low}='b000001010000;//中5
			8,9,10:			  	{high,med,low}='b000001100000;//中6
			11:				  	{high,med,low}='b000000110000;//中3
			12,13,14,15:      {high,med,low}='b000000100000;//中2	
			16,17:			  	{high,med,low}='b000000110000;//中3
			18,19:		 	  	{high,med,low}='b000001010000;//中5
			20,21:            {high,med,low}='b000001100000;//中6
			22:				  	{high,med,low}='b000001100000;//中6
			23:			      {high,med,low}='b000001010000;//中5
			24,25:		      {high,med,low}='b000001100000;//中6
			26,27,28,29,30,31:{high,med,low}='b000000110000;//中3
			32,33:			  	{high,med,low}='b000000110000;//中3
			34,35:			  	{high,med,low}='b000001010000;//中5
			36,37:			  	{high,med,low}='b000001100000;//中6
			38:				  	{high,med,low}='b000001100000;//中6
			39:               {high,med,low}='b000001010000;//中5
			40,41,42:		  	{high,med,low}='b000001100000;//中6
			43:				  	{high,med,low}='b000000110000;//中3
			44,45,46,47:      {high,med,low}='b000000100000;//中2
			48,49:			  	{high,med,low}='b000000000101;//中5
			50,51:			  	{high,med,low}='b000000110000;//中3
			52:				  	{high,med,low}='b000000100000;//中2
			53:				  	{high,med,low}='b000000110000;//中3
			54:				  	{high,med,low}='b000000100000;//中2
			55:			      {high,med,low}='b000000000111;//1
			56,57:			  	{high,med,low}='b000000100000;//中2
			58,59,60,61,62,63:{high,med,low}='b000000000110;//低6
			64,65:			  	{high,med,low}='b000001100000;//中6
         66,67,68,69,70,71:{high,med,low}='b000000100000;//中2
			72,73:			  	{high,med,low}='b000000000101;//中5
			74,75,76,77,78,79:{high,med,low}='b000000110000;//中3
			80:               {high,med,low}='b000000100000;//中2
			81:				  	{high,med,low}='b000000000111;//1
			82,83,84,85,86,87:{high,med,low}='b000001100000;//中6
			88,89:			  	{high,med,low}='b000000000101;//中5
			90,91:			  	{high,med,low}='b000000110000;//中3
			92:	            {high,med,low}='b000000100000;//中2
			93:			      {high,med,low}='b000000110000;//中3
			94:				  	{high,med,low}='b000000100000;//中2
			95:				  	{high,med,low}='b000000000111;//1
			96,97:	         {high,med,low}='b000000100000;//中2
			98,99,100,101,102,103:{high,med,low}='b000001100000;//中6
	endcase
end


endmodule
