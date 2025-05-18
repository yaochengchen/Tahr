
`timescale 1 ns/100 ps

module band_pulse
  ( 

  input  wire antennaI,
  input  wire mask,
  output wire antennaOw,
  
  output wire [23:0] antennaOR,

  output reg [23:0] antennaBP=0,

  input wire  [3:0] trigger_shifter,
  input  wire       clk_r2,
  input  wire       reset,

  output wire antennaS,
  
  output reg tick= 0,

  input wire [23:0] count_1M,
  input wire time_stamp_ok//for band trigger efficiency


  );
  
 reg band_lock=1;//for band trigger efficiency,prevent multi-count of efficiency
  
  parameter T=1;//time delay dt between stations & cables with ofset 2
  parameter timedelay=1;
  parameter resetCounterValue0=0;
reg  antennaS0=1'b0;

reg  [30:0]antennaSs=0;


reg  [4:0]triggerAnt0_c=0;

reg  antennaO0=1'b0;
reg  antennaA0=1'b0;
reg [23:0] antennaR0=24'h000000;

reg [23:0] antennaC0=24'h000000;



assign antennaOR=antennaR0;




assign antennaOw=(antennaSs[T+3])&mask;//hit pattern //cyc change

assign antennaS= (antennaSs[T])&mask;


reg [1:0] shift='b00;

//reg [23:0] count_1M=24'h000000;
reg [7:0] count_pulse_r='h00;


always@(posedge clk_r2)
begin
if(antennaSs[0])triggerAnt0_c<=0;
else if(triggerAnt0_c<'d30)triggerAnt0_c<=triggerAnt0_c+1;

end

always@(posedge clk_r2)
begin
	if(antennaSs[0])antennaSs[29]<=1;
	else if(triggerAnt0_c>'d20)antennaSs[29]<=0;//keep it for 20 clock
	if(antennaSs[29])antennaSs[30]<=1;
	else antennaSs[30]<=antennaS;// unknown  //?????
end



always@(posedge clk_r2)
begin
	if(trigger_shifter<='h4&&trigger_shifter>'h1)//(1,4]
	begin 
		antennaSs<=antennaSs;

	end
	else begin
		antennaSs[28:1]<=antennaSs[27:0];antennaSs[0]<=antennaS0;

	end
end


//	 always@(posedge clk_r2)
//begin
//  count_1M<=count_1M+1'b1;  
//

 always@(posedge clk_r2)
begin
     
		if(count_1M[23]==0&&shift<2'b11)shift<=2'b11; 
		if(count_1M[23]==1&&shift>2'b00)shift<=shift+2'b11; 
		
end


//reg cyc = 1'b1;

always@*
begin
 if(antennaI)antennaO0<=1;
 //if(cyc) antennaO0<=1;
 else if(count_pulse_r=='h01)antennaO0<=0; //cyc think it should be >='h01

 if(antennaI&&count_pulse_r>='h01&&count_pulse_r<timedelay+resetCounterValue0)antennaA0<=1;
 else if(count_pulse_r>=timedelay)antennaA0<=0;

 if(antennaO0) antennaS0<=1;
 else if(count_pulse_r>=resetCounterValue0+timedelay)antennaS0<=0;
end

always@(posedge clk_r2)
begin
  if(trigger_shifter=='h3)begin
  antennaBP[23:0]<=antennaSs[23:0];
                          end
end

 

always@(posedge clk_r2)
begin


	
//   if(antennaI==1&&~^shift&&count_pulse_r>0) antennaC0<=antennaC0+1'b1;//record band trigger rate
   if(antennaO0==1&&~^shift) antennaC0<=antennaC0+1'b1;


//prevent multi-count of efficiency
/*
      if(band_lock&&(~time_stamp_ok)&&antennaO0)
//      if(band_lock&&~time_stamp_ok&&antennaO0==1&&~^shift) 
      begin
      antennaC0<=antennaC0+1'b1;//trigger efficiency count
      band_lock<=1'b0;
      end
      else if(time_stamp_ok) band_lock<=1'b1;
*/

	if(antennaO0&&(count_pulse_r>=1))count_pulse_r<=0;//recount for pulse width

	 else if (antennaA0==1&&count_pulse_r==timedelay) count_pulse_r<=timedelay;//can be remove?
    else if(count_pulse_r<'h3f)count_pulse_r<=count_pulse_r+1'b1;  
	 
	if(count_1M[23]==1&&shift[1]==0&&shift[0]==1)
			begin 
			antennaC0<=24'h000000; 
			tick<=0;
		    end	
		    
  if(count_1M[23]==1&&shift[1]==1&&shift[0]==0)//
			begin
			//antennaR0[T:0]<=antennaSs[T:0];
			antennaR0<=antennaC0;

			tick<=1;
			end

end

	

endmodule

















