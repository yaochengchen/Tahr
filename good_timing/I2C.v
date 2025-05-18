`timescale 10 ns/100 ps

module I2C(CLOCK_01M,CLOCK_01Md,start,SCL,SDA,DAC_DATA);

input CLOCK_01M;
input CLOCK_01Md;
input start;
output SCL,SDA;


input [25:0] DAC_DATA;

reg GO=0;
reg [6:0] SD_COUNTER=7'b0000000;
reg SDI=0,SCLK=0;
//reg [9:0] COUNT;
//wire reset_n;
 
//assign reset_n=reset;
/*reg Tshift=1,CLOCK_01M_f=0;=0
reg [1:0]shifter=2'b00;

always@(posedge clk) CLOCK_01M_f<=CLOCK_01M;
always@(negedge clk)begin
if(CLOCK_01M&&~CLOCK_01M_f)begin
Tshift<=0;
shifter<=2'b01;
end
if(shifter>2'b00)begin 
shifter<=shifter+2'b11;
Tshift<=0;
end
else Tshift<=1;
end*///rising edge adjusting
	


always@(posedge CLOCK_01M )
begin

		if (start)
			GO<=1'b1;
		if (~start)
			GO<=1'b0;	

end


always@(posedge CLOCK_01M )
begin

			if(GO)
				SD_COUNTER<=7'b0;
			else	
				if (SD_COUNTER<47)
					SD_COUNTER<=SD_COUNTER+1;

end

always@(posedge CLOCK_01M )
begin


	case(SD_COUNTER)
		6'd0 : begin SDI<=1; SCLK<=1; end
		//start
		6'd1: begin SCLK<=1;SDI<=1;end
		6'd2: SCLK<=1;
		6'd3: SCLK<=1;
		6'd4 : begin SDI<=1; SCLK<=1; end
		//start
		6'd5: SDI<=0;
		6'd6: SCLK<=0;
		//Slave ADDR
		6'd7: SDI<=0;
		6'd8: SDI<=0;
		6'd9: SDI<=0;

		6'd10: SDI<=1;
		6'd11: SDI<=1;
		6'd12: SDI<=DAC_DATA[25];//A1
		6'd13: SDI<=DAC_DATA[24];//A0
		6'd14: SDI<=0;//write=0,read=1
		//ACK by ad5675
		6'd15: SDI<=1'bz;//slave ACK

		//Command Byte
		6'd16: SDI<=DAC_DATA[23];//0 c3
		6'd17: SDI<=DAC_DATA[22];//0 c2
		//command
		6'd18: SDI<=DAC_DATA[21];//0;//C1
		6'd19: SDI<=DAC_DATA[20];//1;//C0
				//DAC address
		6'd20: SDI<=DAC_DATA[19];//0;//A3
		6'd21: SDI<=DAC_DATA[18];//1;//A2
		6'd22: SDI<=DAC_DATA[17];//1;//A1
		6'd23: SDI<=DAC_DATA[16];//1;//A0
		//ACK by ad5625
		6'd24: SDI<=1'bz;//slave ACK

		//DAC data high byte
		6'd25: SDI<=DAC_DATA[15];//1;//D15
		6'd26: SDI<=DAC_DATA[14];//1;//D14
		6'd27: SDI<=DAC_DATA[13];//1;//D13
		6'd28: SDI<=DAC_DATA[12];//1;//D12
		6'd29: SDI<=DAC_DATA[11];//1;//D11
		6'd30: SDI<=DAC_DATA[10];//1;//D10
		6'd31: SDI<=DAC_DATA[9];//1;//D9
		6'd32: SDI<=DAC_DATA[8];//1;//D8
		//ACK by ad5625
		6'd33: SDI<=1'bz;//slave ACK

		//DAC data low byte
		6'd34: SDI<=DAC_DATA[7];//1;//D7
		6'd35: SDI<=DAC_DATA[6];//1;//D6
		6'd36: SDI<=DAC_DATA[5];//1;//D5
		6'd37: SDI<=DAC_DATA[4];//1;//D4
		6'd38: SDI<=DAC_DATA[3];//D3
		6'd39: SDI<=DAC_DATA[2];//D2
		6'd40: SDI<=DAC_DATA[1];//D1
		6'd41: SDI<=DAC_DATA[0];//D0
		//ACK by ad5675
		6'd42: SDI<=~1'bz;//slave ACK
        //6'd42: SDI<=1'bz;//cyc change
        
		//Stop
		6'd43:  SDI<=1'b0;
		6'd44:  begin SDI<=1'b0;	SCLK<=1'b1;	end
		6'd45: SDI<=1'b1;

		6'd47: begin SDI<=1'b0;	SCLK<=1'b0;	end//cyc add
	endcase
end



assign SCL=((SD_COUNTER>=8 && (SD_COUNTER <44 ))? CLOCK_01Md :SCLK);
assign SDA=SDI;
endmodule
