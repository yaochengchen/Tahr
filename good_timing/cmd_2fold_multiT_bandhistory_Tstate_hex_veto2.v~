// need to modify get trigger rate
// need to modify tick[]

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:23 12/09/2013 
// Design Name: 
// Module Name:    cmd 
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
module cmd(
    input wire clk,
	 input wire clk_r2,
	 input wire pps,
    input wire [7:0] RxD_data, 
	 input wire RxD_data_ready,
	 input wire [7:0] RxD_datat, 
	 input wire RxD_data_readyt,
	 output wire TxDat,
	 output reg TxDatT,
	 output wire [7:0] dataout,
	 output wire [7:0] dataoutT,
    output wire [7:0] resetCounnterValue,
//	 output wire [7:0] charo,
	 output reg reset,

	 output wire trigger,
	 
  input  wire [7:0] antennaI1V,
  input  wire [7:0] antennaI2V,
  input  wire [7:0] antennaI3V,
  input  wire [7:0] antennaI4V,

	 
  input  wire [7:0] antennaI1H,
  input  wire [7:0] antennaI2H,
  input  wire [7:0] antennaI3H,
  input  wire [7:0] antennaI4H,

	 output SCL0,
	 output SCL1,

	 output SDA0,
	 output SDA1,

     
     output wire [3:0] testo,
	 output reg test=1'b0
	 );
	 

	 
	 
	 `include "cmd_header.v"
	 `include "pulsemodulesLab.v"	
    `include "decoder.v"


	   assign testo[0] = triggerIV;
	   assign testo[1] = triggerIH;
	   	   assign testo[2] = triggerI;
	   	   assign testo[3] = triggerC[0];
	
///////////////////////clock/////////////////////

	 always@*
	   begin
		  if(repeater==5000)risingT<=1;
		  else risingT<=0;
		end
/*
     always@*
	   begin
		  if(repeaterR==repeaterTime)risingT2<=1;
		  else risingT2<=0;
		end
*/



always@(posedge clk_r2) 
begin if(trigger_shifter==('hd+offsetCLK)||(timeoutS&&~Rstate))lock<=0;//cyc add ||(timeoutS&&~Rstate) //need to modify c code to low down threshold and unlock when receive a 0
	if(RxD_data_statet==1)lock<=1;
end

always@(posedge clk_r)
begin
if(!pps)repeater_shifter<=2'b00;
if(repeater_shifter==2'b00&&pps)repeater_shifter<=2'b11;
if(repeater_shifter>2'b01&&pps)repeater_shifter<=repeater_shifter+2'b11;
end

always@(posedge clk_r)
begin

 if(RxD_data_state=='h7)
   begin
		if(shifter[1]&shifter[0] && (RxD_data!=end_command)) 
			repeaterPeriod_[27:24]<=RxD_data[3:0];

		if(shifter[1]&~shifter[0] && (RxD_data!=end_command)) 
		begin repeaterPeriod_<={repeaterPeriod_[23:0],repeaterPeriod_[27:24]};end
		if(RxD_data_ready&&RxD_data==end_command)  repeaterPeriod<=repeaterPeriod_;
	end

	 if(RxD_data_state=='h4)
   begin
		if(shifter[1]&shifter[0] && (RxD_data!=end_command)) 
			repeaterTime_[27:24]<=RxD_data[3:0];

		if(shifter[1]&~shifter[0] && (RxD_data!=end_command)) 
		begin repeaterTime_<={repeaterTime_[23:0],repeaterTime_[27:24]};end
		if(RxD_data_ready&&RxD_data==end_command)  repeaterTime<=repeaterTime_;
	end

  if(RxD_data_state=='h2)
   begin
		repeaterPeriod<=28'h04C4B3F;	repeaterPeriod_<=28'h04C4B3F;

	end
end	


always@(negedge clk_r)
begin

      if(&repeater_shifter|repeater[25:0]>='h2FAF07F)
	       begin 
				repeater[25:0]<=26'b0;	repeater[27:26]<=repeater[27:26]+1'b1;  //repeater[27:26]<=2'b0;//
			 end
	   else begin
			repeater[25:0]<=repeater[25:0]+1'b1;

		    end
		

if(triggerINFOswitch|RxD_data_ready)repeaterTO<=28'h0000000;
else  begin repeaterTO<=repeaterTO+1'b1;end

if(&repeater_shifter|repeaterR[27:0]>='h2FAF07F) repeaterR<=0;else repeaterR<=repeaterR+1'b1;

end






	 ///////PPS trigger/////







		 always@(posedge clk_r2)
begin

		triggerAnt1VoS[T:1]<=triggerAnt1VoS[T-1:0];triggerAnt1VoS[0]<=triggerAnt1V;
		triggerAnt2VoS[T:1]<=triggerAnt2VoS[T-1:0];triggerAnt2VoS[0]<=triggerAnt2V;
		triggerAnt3VoS[T:1]<=triggerAnt3VoS[T-1:0];triggerAnt3VoS[0]<=triggerAnt3V;
		triggerAnt4VoS[T:1]<=triggerAnt4VoS[T-1:0];triggerAnt4VoS[0]<=triggerAnt4V;


		triggerAnt1HoS[T:1]<=triggerAnt1HoS[T-1:0];triggerAnt1HoS[0]<=triggerAnt1H;
		triggerAnt2HoS[T:1]<=triggerAnt2HoS[T-1:0];triggerAnt2HoS[0]<=triggerAnt2H;
		triggerAnt3HoS[T:1]<=triggerAnt3HoS[T-1:0];triggerAnt3HoS[0]<=triggerAnt3H;
		triggerAnt4HoS[T:1]<=triggerAnt4HoS[T-1:0];triggerAnt4HoS[0]<=triggerAnt4H;

end



//detected rising edge for good timing
always@(posedge clk_r2)
begin

      if(~triggerAnt1VoS[1]&&triggerAnt1VoS[0])
         begin 
              triggerAnt1VoT<=1'b1;
              CountAnt1VoT<=0;
         end
      else 
         begin 
              if(CountAnt1VoT>=AntWidth) triggerAnt1VoT<=1'b0;
              CountAnt1VoT<=CountAnt1VoT+1'b1;
         end
         
 
       if(~triggerAnt2VoS[1]&&triggerAnt2VoS[0])
         begin 
              triggerAnt2VoT<=1'b1;
              CountAnt2VoT<=0;
         end
      else 
         begin 
              if(CountAnt2VoT>=AntWidth) triggerAnt2VoT<=1'b0;
              CountAnt2VoT<=CountAnt2VoT+1'b1;
         end
         

      if(~triggerAnt3VoS[1]&&triggerAnt3VoS[0])
         begin 
              triggerAnt3VoT<=1'b1;
              CountAnt3VoT<=0;
         end
      else 
         begin 
              if(CountAnt3VoT>=AntWidth) triggerAnt3VoT<=1'b0;
              CountAnt3VoT<=CountAnt3VoT+1'b1;
         end
         
         
         
       if(~triggerAnt4VoS[1]&&triggerAnt4VoS[0])
         begin 
              triggerAnt4VoT<=1'b1;
              CountAnt4VoT<=0;
         end
      else 
         begin 
              if(CountAnt4VoT>=AntWidth) triggerAnt4VoT<=1'b0;
              CountAnt4VoT<=CountAnt4VoT+1'b1;
         end
         


   
   
   
   
      if(~triggerAnt1HoS[1]&&triggerAnt1HoS[0])
         begin 
              triggerAnt1HoT<=1'b1;
              CountAnt1HoT<=0;
         end
      else 
         begin 
              if(CountAnt1HoT>=AntWidth) triggerAnt1HoT<=1'b0;
              CountAnt1HoT<=CountAnt1HoT+1'b1;
         end
         
 
       if(~triggerAnt2HoS[1]&&triggerAnt2HoS[0])
         begin 
              triggerAnt2HoT<=1'b1;
              CountAnt2HoT<=0;
         end
      else 
         begin 
              if(CountAnt2HoT>=AntWidth) triggerAnt2HoT<=1'b0;
              CountAnt2HoT<=CountAnt2HoT+1'b1;
         end
         

      if(~triggerAnt3HoS[1]&&triggerAnt3HoS[0])
         begin 
              triggerAnt3HoT<=1'b1;
              CountAnt3HoT<=0;
         end
      else 
         begin 
              if(CountAnt3HoT>=AntWidth) triggerAnt3HoT<=1'b0;
              CountAnt3HoT<=CountAnt3HoT+1'b1;
         end
         
         
         
       if(~triggerAnt4HoS[1]&&triggerAnt4HoS[0])
         begin 
              triggerAnt4HoT<=1'b1;
              CountAnt4HoT<=0;
         end
      else 
         begin 
              if(CountAnt4HoT>=AntWidth) triggerAnt4HoT<=1'b0;
              CountAnt4HoT<=CountAnt4HoT+1'b1;
         end
         


              
end



		 always@(posedge clk_r2)
begin

		triggerAnt1VoTS[T:1]<=triggerAnt1VoTS[T-1:0];triggerAnt1VoTS[0]<=triggerAnt1VoT;
		triggerAnt2VoTS[T:1]<=triggerAnt2VoTS[T-1:0];triggerAnt2VoTS[0]<=triggerAnt2VoT;
		triggerAnt3VoTS[T:1]<=triggerAnt3VoTS[T-1:0];triggerAnt3VoTS[0]<=triggerAnt3VoT;
		triggerAnt4VoTS[T:1]<=triggerAnt4VoTS[T-1:0];triggerAnt4VoTS[0]<=triggerAnt4VoT;
		
		triggerAnt1HoTS[T:1]<=triggerAnt1HoTS[T-1:0];triggerAnt1HoTS[0]<=triggerAnt1HoT;
		triggerAnt2HoTS[T:1]<=triggerAnt2HoTS[T-1:0];triggerAnt2HoTS[0]<=triggerAnt2HoT;
		triggerAnt3HoTS[T:1]<=triggerAnt3HoTS[T-1:0];triggerAnt3HoTS[0]<=triggerAnt3HoT;
		triggerAnt4HoTS[T:1]<=triggerAnt4HoTS[T-1:0];triggerAnt4HoTS[0]<=triggerAnt4HoT;

end





/*
always@(posedge clk_r2)
begin	 
triggerNchannelV<=triggerAnt1VoS[0]+triggerAnt2VoS[0]+triggerAnt3VoS[0]+
                triggerAnt4VoS[0];
end
always@(posedge clk_r2)
begin	 
triggerNchannelH<=triggerAnt1HoS[0]+triggerAnt2HoS[0]+triggerAnt3HoS[0]+
                triggerAnt4HoS[0];
end
*/





always@(posedge clk_r2)
begin	 
triggerNchannelV<=triggerAnt1VoTS[1]+triggerAnt2VoTS[1]+triggerAnt3VoTS[0]+
                triggerAnt4VoTS[4];//antenna 1,2 delay 10ns, antenna 4 delay 40ns
end
always@(posedge clk_r2)
begin	 
triggerNchannelH<=triggerAnt1HoTS[1]+triggerAnt2HoTS[1]+triggerAnt3HoTS[0]+
                triggerAnt4HoTS[4];
end






 
	
always@(posedge clk_r2)
begin 
   if(triggerNchannelV>triggerTH)triggerIV<=1;
   else if(~lock&&trigger_shifter<='b101)triggerIV<=0;

end	
always@(posedge clk_r2)
begin
   if(triggerNchannelH>triggerTH)triggerIH<=1;
   else if(~lock&&trigger_shifter<='b101)triggerIH<=0;

end
	





always@*
begin
if((mode[2]&triggerI)|(mode[0]&risingT))triggerLast<=1;
else if(~lock&&(trigger_shifter<=4'he+offsetCLK))triggerLast<=0;
end



always@(posedge clk_r2)
begin
if(triggerLast&&(trigger_shifter<3'b001+offsetCLK)&&lock)

trigger_shifter<='hf;
else if(trigger_shifter>0)
trigger_shifter<=trigger_shifter+4'hf; // +4'hf = +1111 means -1
end

always@(posedge clk_r)

begin
if(RxD_data_state=='hb||RxD_data_state=='hd||RxD_data_state=='h7||RxD_data_state=='h8||RxD_data_state=='h9||RxD_data_state=='h1)
begin

 if(RxD_data_ready&&RxD_data==8'b00110000) char[7]<=0;
 if(RxD_data_ready&&RxD_data==8'b00110001) char[7]<=1;
 if(shifter[1]&~shifter[0]&&RxD_data!=end_command)char<={char[6:0],char[7]};
 if(RxD_data_ready&&RxD_data==backspace)
 begin
  char<='h0;
 end
end




if(RxD_data_state=='hc)
begin
	 if(RxD_data_ready&&RxD_data==8'b00110000) char_mask[11]<=0;//48 for char 0
 	 if(RxD_data_ready&&RxD_data==8'b00110001) char_mask[11]<=1;//49 for char 1
 	 if(shifter[1]&~shifter[0]&&RxD_data!=end_command)char_mask<={char_mask[10:0],char_mask[11]};
	 if(RxD_data_ready&&RxD_data==backspace)
	 begin
  	char_mask<='h000;
 	 end
end





end 
//////////////return value/////////////////


	

always@(negedge clk_r)
begin
  

    if(RxD_data_state=='ha)begin rchar[7:0]<=pulse_duration_time;rchar[47:8]<=16'b0000000; end//need to change c code
    if(RxD_data_state=='he)begin rchar[9:4]<=triggerTH;rchar[3:0]<=triggerAntTH;rchar[47:10]<=16'b0; end


	
	
	 /////////////////////////////////////////////////////////////
 //     tx
////////////////////////////////////////////////////////////


	 
	 
		if(RxD_data_statet)rchar[47]<=1'b1;//sent 1 to computer if triggered

		if(timeoutS)rchar[47]<=1'b0;//sent 0 to computer if haven't triggered in 5s

      if(shifter_tx[1]&&shifter_tx[0])
		begin 
		 if(counter_txO2==6'b000000)begin endR<=0;rchar[47]<=1'b0;end//00001010 huiche, last one
       else begin endR<=1;end 	  
	   end

 if(shifter_tx[1]&&~shifter_tx[0]&&counter_txO2<6'b110011)//&&counter_txO2>4'b0000)
    begin 
	  TxData<=1;//start transmision	 
    end

 if(~shifter_tx[1]&&shifter_tx[0])
    begin 
       TxData<=0;
	  if(counter_txO2>6'b000000&&counter_txO2<6'b110011)rchar<={rchar[46:0],rchar[47]};
    end

 if(~shifter_tx[1]&&~shifter_tx[0])   TxData<=0;	 
	 

 //??????????????????????????/
 if(trigger)
    begin // need to modify c code  // to see which band has been triggered, hit pattern
     if(RxD_data_state=='h5)begin rchar[7:0]<=antennaO1Hw; rchar[15:8]<=antennaO2Hw; rchar[23:16]<=antennaO3Hw; 
	            rchar[31:24]<=antennaO4Hw;    
	                    end

     if(RxD_data_state=='h6)begin rchar[7:0]<=antennaO1Vw; rchar[15:8]<=antennaO2Vw; rchar[23:16]<=antennaO3Vw; 
	            rchar[31:24]<=antennaO4Vw;    
	                    end
    end
	 
	 
	 
if(RxD_data==end_command&&RxD_data_state=='hb&& shifter[1]&& ~shifter[0])begin// cyc add ~shifter[0]
  case(channel)//which board
 
 //H-pol 
  4'b0000 : 
   begin if(~tick[0])begin
		case(mask)//which band
	4'b0001: begin rchar[47:24]<=antennaO1HR0; rchar[23:0]<=24'b0;  end
	4'b0010: begin rchar[47:24]<=antennaO1HR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO1HR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO1HR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO1HR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO1HR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO1HR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO1HR7; rchar[23:0]<=24'b0;	end
                endcase 
                     end
  end
  


  4'b0010 :
  begin if(~tick[1])begin 
     case(mask)
	4'b0001: begin rchar[47:24]<=antennaO2HR0; rchar[23:0]<=24'b0;	end 
	4'b0010: begin rchar[47:24]<=antennaO2HR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO2HR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO2HR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO2HR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO2HR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO2HR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO2HR7; rchar[23:0]<=24'b0;	end
	endcase end
  end
  


  4'b0100 :
  begin if(~tick[2])begin 
   case(mask)
	4'b0001: begin rchar[47:24]<=antennaO3HR0; rchar[23:0]<=24'b0;	end 
	4'b0010: begin rchar[47:24]<=antennaO3HR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO3HR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO3HR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO3HR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO3HR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO3HR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO3HR7; rchar[23:0]<=24'b0;	end
	endcase end
  end
  


  4'b0110 :
  begin if(~tick[3])begin 
   case(mask)
	4'b0001: begin rchar[47:24]<=antennaO4HR0; rchar[23:0]<=24'b0;	end 
	4'b0010: begin rchar[47:24]<=antennaO4HR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO4HR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO4HR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO4HR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO4HR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO4HR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO4HR7; rchar[23:0]<=24'b0;	end
	endcase end
  end
  






//V-pol
  4'b0001 : 
   begin if(~tick[6])begin
		case(mask)
	4'b0001: begin rchar[47:24]<=antennaO1VR0; rchar[23:0]<=24'b0;  end
	4'b0010: begin rchar[47:24]<=antennaO1VR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO1VR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO1VR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO1VR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO1VR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO1VR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO1VR7; rchar[23:0]<=24'b0;	end
                endcase 
                     end
  end
  


  4'b0011 :
  begin if(~tick[7])begin 
     case(mask)
	4'b0001: begin rchar[47:24]<=antennaO2VR0; rchar[23:0]<=24'b0;	end 
	4'b0010: begin rchar[47:24]<=antennaO2VR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO2VR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO2VR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO2VR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO2VR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO2VR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO2VR7; rchar[23:0]<=24'b0;	end
	endcase end
  end
  


  4'b0101 :
  begin if(~tick[8])begin 
   case(mask)
	4'b0001: begin rchar[47:24]<=antennaO3VR0; rchar[23:0]<=24'b0;	end 
	4'b0010: begin rchar[47:24]<=antennaO3VR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO3VR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO3VR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO3VR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO3VR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO3VR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO3VR7; rchar[23:0]<=24'b0;	end
	endcase end
  end
  


  4'b0111 :
  begin if(~tick[9])begin 
   case(mask)
	4'b0001: begin rchar[47:24]<=antennaO4VR0; rchar[23:0]<=24'b0;	end
	4'b0010: begin rchar[47:24]<=antennaO4VR1; rchar[23:0]<=24'b0;	end
	4'b0011: begin rchar[47:24]<=antennaO4VR2; rchar[23:0]<=24'b0;	end
	4'b0100: begin rchar[47:24]<=antennaO4VR3; rchar[23:0]<=24'b0;	end
	4'b0101: begin rchar[47:24]<=antennaO4VR4; rchar[23:0]<=24'b0;	end
	4'b0110: begin rchar[47:24]<=antennaO4VR5; rchar[23:0]<=24'b0;	end
	4'b0111: begin rchar[47:24]<=antennaO4VR6; rchar[23:0]<=24'b0;	end
	4'b1000: begin rchar[47:24]<=antennaO4VR7; rchar[23:0]<=24'b0;	end
	endcase end
  end
  





  
  4'b1111 :
  begin 
  if(~tick[12])begin 
   case(mask)

   4'b0000: begin rchar[47:24]<=triggerVR0; rchar[23:0]<=24'b0;	end//get_sys_trigger_rate

   4'b0001: begin rchar[47:24]<=triggerVR1; rchar[23:0]<=24'b0;	end//get_sys_trigger_efficiency
   endcase    
	           end

  end



  4'b1101 : //get_band_mask;
  begin  
   case(mask)

   4'b0001: begin rchar[47:24]<=channel1Hmask; rchar[23:0]<=24'b0;	end
   4'b0010: begin rchar[47:24]<=channel2Hmask; rchar[23:0]<=24'b0;	end
   4'b0011: begin rchar[47:24]<=channel3Hmask; rchar[23:0]<=24'b0;	end
   4'b0100: begin rchar[47:24]<=channel4Hmask; rchar[23:0]<=24'b0;	end

   4'b0111: begin rchar[47:24]<=channel1Vmask; rchar[23:0]<=24'b0;	end
   4'b1000: begin rchar[47:24]<=channel2Vmask; rchar[23:0]<=24'b0;	end
   4'b1001: begin rchar[47:24]<=channel3Vmask; rchar[23:0]<=24'b0;	end
   4'b1010: begin rchar[47:24]<=channel4Vmask; rchar[23:0]<=24'b0;	end

   endcase    
	           

  end



  
 endcase
 end
 
end 





/////////////////////////////////////////////////////////////
//     trigger tx
////////////////////////////////////////////////////////////
//reg trigger_o=1'b0;
always@(posedge clk_r2)
begin
      if(shifter_txt[1]&&shifter_txt[0])
		begin 
			
		 if(txtSatrtEnd)begin endRT<=0;dat_hex<=4'b1010;end//last one is huiche
       else begin endRT<=1;dat_hex<=rcharT[239:236];end 	  
	   end
	  if(shifter_txt[1]&&~shifter_txt[0])//&&counter_txO2t<5'b10011)//&&counter_txO2>4'b0000)
    begin 
	  TxDatT<=1;// start transmision    	 
    end
 if(~shifter_txt[1]&&shifter_txt[0]&&clk) //&&clk to prevent shift rcharT twice, since 1 clk_r has 2 clk_r2
    begin 
       TxDatT<=0;
       if(~txtSatrtEnd)rcharT<={rcharT[235:0],rcharT[239:236]};
    end
 if(~shifter_txt[1]&&~shifter_txt[0])   TxDatT<=0;


	


//???????????????????????????/
// need to modify c code  // to see which band has been triggered, hit pattern
 if(trigger==1&&lock&&trigger_shifter=='hf&&triggerInfo==0&&(~mode[0]||risingT==1'b0))  //cyc add &&(~mode[0]||risingT==1'b0)
		   begin 
			  rcharT[239:216]<=repeaterR[27:4];
	
//			  rcharT[239:152]<=88'hffffffffffffffffffffff;
			  
			  rcharT[151:0]<=152'b0;
			  
			  rcharT[159:152]<=antennaO1Hw; rcharT[167:160]<=antennaO2Hw;
			  rcharT[175:168]<=antennaO3Hw; rcharT[183:176]<=antennaO4Hw;

			  rcharT[191:184]<=antennaO1Vw; rcharT[199:192]<=antennaO2Vw;
			  rcharT[207:200]<=antennaO3Vw; rcharT[215:208]<=antennaO4Vw;

		   end



else if(mode[0]&&risingT==1'b1&&lock&&trigger_shifter=='hf&&triggerInfo==0)
		  begin
		     rcharT[239:216]<=repeaterR[27:4];
			  rcharT[215:0]<=216'b0;
//			rcharT[239:0]<=240'b0;
 
		  end
		  
		  
		  
		  
/*
if(trigger_shifter=='h2&&(|triggerInfo))//cyc add triggerInfo
   begin
   	rcharT[239:216]<=repeaterR[27:4];
		case(triggerInfo)

	   'h1:
		   begin
			  rcharT[23:0]<=antennaO1HBP0;
			  rcharT[47:24]<=antennaO1HBP1;
			  rcharT[71:48]<=antennaO1HBP2;
			  rcharT[95:72]<=antennaO1HBP3;
			  rcharT[119:96]<=antennaO1HBP4;
			  rcharT[143:120]<=antennaO1HBP5;
			  rcharT[167:144]<=antennaO1HBP6;
			  rcharT[191:168]<=antennaO1HBP7;
			  rcharT[215:192]<=triggerAnt1HoS;
			end
	   'h2:
		   begin
			  rcharT[23:0]<=antennaO2HBP0;
			  rcharT[47:24]<=antennaO2HBP1;
			  rcharT[71:48]<=antennaO2HBP2;
			  rcharT[95:72]<=antennaO2HBP3;
			  rcharT[119:96]<=antennaO2HBP4;
			  rcharT[143:120]<=antennaO2HBP5;
			  rcharT[167:144]<=antennaO2HBP6;
			  rcharT[191:168]<=antennaO2HBP7;
			  rcharT[215:192]<=triggerAnt2HoS;
			end
	   'h3:
		   begin
			  rcharT[23:0]<=antennaO3HBP0;
			  rcharT[47:24]<=antennaO3HBP1;
			  rcharT[71:48]<=antennaO3HBP2;
			  rcharT[95:72]<=antennaO3HBP3;
			  rcharT[119:96]<=antennaO3HBP4;
			  rcharT[143:120]<=antennaO3HBP5;
			  rcharT[167:144]<=antennaO3HBP6;
			  rcharT[191:168]<=antennaO3HBP7;
			  rcharT[215:192]<=triggerAnt3HoS;
			end
	   'h4:
		   begin
			  rcharT[23:0]<=antennaO4HBP0;
			  rcharT[47:24]<=antennaO4HBP1;
			  rcharT[71:48]<=antennaO4HBP2;
			  rcharT[95:72]<=antennaO4HBP3;
			  rcharT[119:96]<=antennaO4HBP4;
			  rcharT[143:120]<=antennaO4HBP5;
			  rcharT[167:144]<=antennaO4HBP6;
			  rcharT[191:168]<=antennaO4HBP7;
			  rcharT[215:192]<=triggerAnt4HoS;
			end

			
		'h7:
		   begin
			  rcharT[143:120]<=triggerAnt1HoS;
			  rcharT[167:144]<=triggerAnt2HoS;
			  rcharT[191:168]<=triggerAnt3HoS;
			  rcharT[215:192]<=triggerAnt4HoS;

			end


	   'h9:
		   begin
			  rcharT[23:0]<=antennaO1VBP0;
			  rcharT[47:24]<=antennaO1VBP1;
			  rcharT[71:48]<=antennaO1VBP2;
			  rcharT[95:72]<=antennaO1VBP3;
			  rcharT[119:96]<=antennaO1VBP4;
			  rcharT[143:120]<=antennaO1VBP5;
			  rcharT[167:144]<=antennaO1VBP6;
			  rcharT[191:168]<=antennaO1VBP7;
			  rcharT[215:192]<=triggerAnt1VoS;
			end
	   'ha:
		   begin
			  rcharT[23:0]<=antennaO2VBP0;
			  rcharT[47:24]<=antennaO2VBP1;
			  rcharT[71:48]<=antennaO2VBP2;
			  rcharT[95:72]<=antennaO2VBP3;
			  rcharT[119:96]<=antennaO2VBP4;
			  rcharT[143:120]<=antennaO2VBP5;
			  rcharT[167:144]<=antennaO2VBP6;
			  rcharT[191:168]<=antennaO2VBP7;
			  rcharT[215:192]<=triggerAnt2VoS;
			end
	   'hb:
		   begin
			  rcharT[23:0]<=antennaO3VBP0;
			  rcharT[47:24]<=antennaO3VBP1;
			  rcharT[71:48]<=antennaO3VBP2;
			  rcharT[95:72]<=antennaO3VBP3;
			  rcharT[119:96]<=antennaO3VBP4;
			  rcharT[143:120]<=antennaO3VBP5;
			  rcharT[167:144]<=antennaO3VBP6;
			  rcharT[191:168]<=antennaO3VBP7;
			  rcharT[215:192]<=triggerAnt3VoS;
			end
	   'hc:
		   begin
			  rcharT[23:0]<=antennaO4VBP0;
			  rcharT[47:24]<=antennaO4VBP1;
			  rcharT[71:48]<=antennaO4VBP2;
			  rcharT[95:72]<=antennaO4VBP3;
			  rcharT[119:96]<=antennaO4VBP4;
			  rcharT[143:120]<=antennaO4VBP5;
			  rcharT[167:144]<=antennaO4VBP6;
			  rcharT[191:168]<=antennaO4VBP7;
			  rcharT[215:192]<=triggerAnt4VoS;
			end

			
		'hf:
		   begin
			  rcharT[143:120]<=triggerAnt1VoS;
			  rcharT[167:144]<=triggerAnt2VoS;
			  rcharT[191:168]<=triggerAnt3VoS;
			  rcharT[215:192]<=triggerAnt4VoS;

			end
			endcase
   end
*/

end
///////////////////////////////////////////////////////////////







always@*
begin 
if(trigger_shifter>2&&~Rstate)triggerINFOswitch<=1;// cyc add ~Rstate // this will send 2 char, see counter_txO2
else triggerINFOswitch<=0;
end


always@(posedge clk_r)
begin
if(triggerINFOswitch|RxD_data_ready)timeoutstate<=0;
if(repeaterTO=='hFFFF006)timeoutstate<='b1;
if(repeaterTO=='hFFFF001&&timeoutstate&&~Rstate)
begin
	timeoutS<=1;
	timeoutstate<=0;
end
else timeoutS<=0;
end	





always@(negedge clk_r)
begin
//counter_tx=0->counter_txO-1;counter_txO=0->counter_txO2-1;counter_txO2=0->Rstate=0,Finish
 if(counter_tx>0) begin counter_tx<=counter_tx+9'b111111111; end
 if(counter_tx==0&&counter_txO>0)
   begin counter_txO<=counter_txO+4'b1111; counter_tx<=countt; end//+4b'1111 means -1   countt relate to baund rate
 if(counter_txO==0&&counter_txO2>0)begin counter_txO<=4'b1011;counter_txO2<=counter_txO2+6'b111111;end//9,time for transmit 1 data
 if(shifter_tx>0) begin shifter_tx<=shifter_tx+2'b11;end
 if(counter_txO==0&&Rstate)begin  shifter_tx<=2'b11; end
 if(shifter_tx==2'b00&&counter_txO2==6'b000000)begin Rstate<=0;end

 if((RxD_data==end_command&&(shifter[0]&shifter[1])&&
   (RxD_data_state=='ha||RxD_data_state=='hb
   ||RxD_data_state=='h4||RxD_data_state=='he))||(trigger&&(RxD_data_state=='h5||RxD_data_state=='h6)))
	//when command received, sent data back
 begin counter_txO2<=6'b110001;Rstate<=1; end //48bit+last bit huiche

 
else if(timeoutS^triggerINFOswitch)  begin counter_txO2<=6'b000010;Rstate<=1; end
//when trigger sent 1 back or 5s without trigger sent 0 back

end





always@(negedge clk_r)
begin


 if(counter_txt>0) begin counter_txt<=counter_txt+9'b111111111; end
 if(counter_txt==0&&counter_txOt>0)begin counter_txOt<=counter_txOt+4'b1111; counter_txt<=countt; end
 if(counter_txOt==0&&counter_txO2t>0)begin counter_txOt<=4'b1100;counter_txO2t<=counter_txO2t+6'b111111;end
 if(shifter_txt>0) begin shifter_txt<=shifter_txt+2'b11;end
 if(counter_txOt==0&&Rstatet)begin  shifter_txt<=2'b11; end
 if(shifter_txt==2'b00&&counter_txO2t==6'b000000)begin Rstatet<=0;end 

 if(timeoutS&&~triggerINFOswitch)
   begin
        counter_txO2t<=1;
	      Rstatet<=1;
			shifter_txt<=2'b11;
			counter_txOt<=4'b1101;
   end

 if(triggerINFOswitch)
     begin 
	      if(triggerInfo!='h0)
			    begin counter_txO2t<=61;end//(240/4=60) + 1 bit huiche 
	      else 
			    //begin counter_txO2t<=19;end //cyc change
			    begin counter_txO2t<=23;end
	      Rstatet<=1;
			shifter_txt<=2'b11;
			counter_txOt<=4'b1101;//let counter_txOt don't be 0 first,otherwise will immediately activate shifter_txt; wait for triggerINFOswitch to be 0
	  end

  if(~shifter_txt[1]&&shifter_txt[0]&&counter_txO2t>0)
      begin
		  if(counter_txO2t<=1)txtSatrtEnd<=1;//last bit for huiche //first bit is huiche, so need to read twice
	     else txtSatrtEnd<=0;
		end
 //end
end




////////////threshold control///////////////

always@(posedge clk_r)
begin

	if(RxD_data_state=='h3)
	begin
		if(RxD_data_ready&&RxD_data==8'b00110000) threshold[27]<=0;
		if(RxD_data_ready&&RxD_data==8'b00110001) threshold[27]<=1;
		if(shifter[1]&shifter[0] && (RxD_data!=end_command)) begin threshold<={threshold[26:0],threshold[27]};end
		if(RxD_data_ready&&RxD_data==backspace)  threshold<=28'b0;
	end

end

assign send0=th0switch;
assign send1=th1switch;
assign send2=th2switch;

wire clk_0_1M;
wire clk_0_1MD;
parameter on='b1;

	  

clk_01Md clk_01M_00(.clk(clk_r),.o_clk(clk_0_1M),.o_clkd(clk_0_1MD));//0.1M

always@(posedge clk_0_1M)
begin
if(th0switch||th1switch||th2switch)
shifter_01M<=2'b11;
if(shifter_01M>0)
shifter_01M<=shifter_01M+2'b11;
end

I2C I2C_0(.CLOCK_01M(clk_0_1M),.CLOCK_01Md(clk_0_1MD),.start(send0),.SCL(SCL0),.SDA(SDA0),
        .DAC_DATA(threshold[25:0]));

I2C I2C_1(.CLOCK_01M(clk_0_1M),.CLOCK_01Md(clk_0_1MD),.start(send1),.SCL(SCL1),.SDA(SDA1),
       .DAC_DATA(threshold[25:0]));		  



endmodule

