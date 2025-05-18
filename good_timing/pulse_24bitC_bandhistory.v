
`timescale 1 ns/100 ps

module pulse
  ( 

  input  wire [7:0] antennaI,
  input  wire [7:0] mask,
  output wire [7:0] antennaOw,
  output wire triggerAnt,
  output wire [23:0] antennaOR0,
  output wire [23:0] antennaOR1,
  output wire [23:0] antennaOR2,
  output wire [23:0] antennaOR3,
  output wire [23:0] antennaOR4,
  output wire [23:0] antennaOR5,
  output wire [23:0] antennaOR6,
  output wire [23:0] antennaOR7,
  output wire [23:0] antennaBP0=0,
  output wire [23:0] antennaBP1=0,
  output wire [23:0] antennaBP2=0,
  output wire [23:0] antennaBP3=0,
  output wire [23:0] antennaBP4=0,
  output wire [23:0] antennaBP5=0,
  output wire [23:0] antennaBP6=0,
  output wire [23:0] antennaBP7=0,
  input wire  [3:0] trigger_shifter,
  input  wire       clk_r2,
  input  wire       reset,
  input  wire [7:0] resetCounnterValue,//for Ant. scaler
  input wire [3:0] triggerAntTH,
  output wire tick= 0,
  output wire [23:0]testo,
  input wire time_stamp_ok
 // input  wire [5:0] timedelay
  );
  
  wire [7:0] antennaS;
  
  parameter T=1;//time delay dt between stations & cables with ofset 2
  parameter timedelay=1;
  parameter resetCounterValue0=0;
 
 
assign testo[7] = &antennaS;

// reg [23:0] cyc = 24'hfffff0;

// assign antennaOR0 = cyc;

reg [23:0] count_1M=24'h000000;

   always@(posedge clk_r2)
begin
  count_1M<=count_1M+1'b1;  
end


 
  band_pulse #(T,3,resetCounterValue0) band1   // timedelay 3 time delay compare to band-3; 1 for a clock, 100MHz
  (
  .antennaI(antennaI[0]),
  .mask(mask[7]),//count from 7:0
  .antennaOw(antennaOw[0]),
  
  .antennaOR(antennaOR0),

  .antennaBP(antennaBP0),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[0]),

  .tick(tick),

  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  );
 
  
 
 

 
 
 
  band_pulse #(T,4,resetCounterValue0) band2 //timedelay 4
  (
  .antennaI(antennaI[1]),
  .mask(mask[6]),
  .antennaOw(antennaOw[1]),
  
  .antennaOR(antennaOR1),

  .antennaBP(antennaBP1),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[1]),

  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  );
  
  
  
  
  
  
  
  
  
  
    band_pulse #(T,1,resetCounterValue0) band3 //timedelay 1
  (
  .antennaI(antennaI[2]),
  .mask(mask[5]),
  .antennaOw(antennaOw[2]),
  
  .antennaOR(antennaOR2),

  .antennaBP(antennaBP2),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[2]),

  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  );
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    band_pulse #(T,4,resetCounterValue0) band4 //timedelay4
  (
  .antennaI(antennaI[3]),
  .mask(mask[4]),
  .antennaOw(antennaOw[3]),
  
  .antennaOR(antennaOR3),

  .antennaBP(antennaBP3),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[3]),

  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  );
  
 
 
 
 
 
 
     band_pulse #(T,3,resetCounterValue0) band5 //timedelay 3
  (

  .antennaI(antennaI[4]),
  .mask(mask[3]),
  .antennaOw(antennaOw[4]),
  
  .antennaOR(antennaOR4),

  .antennaBP(antennaBP4),


  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),

  .reset(reset),

  .antennaS(antennaS[4]),


  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  ); 
 
 
      band_pulse #(T,1,resetCounterValue0) band6 //timedelay 1
  (
  .antennaI(antennaI[5]),
  .mask(mask[2]),
  .antennaOw(antennaOw[5]),
  
  .antennaOR(antennaOR5),

  .antennaBP(antennaBP5),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[5]),

  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  ); 
  
  
  
       band_pulse #(T,1,resetCounterValue0) band7  //timedelay 1
  (
  .antennaI(antennaI[6]),
  .mask(mask[1]),
  .antennaOw(antennaOw[6]),
  
  .antennaOR(antennaOR6),

  .antennaBP(antennaBP6),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[6]),

  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  ); 
  
  
  
       band_pulse #(T,3,resetCounterValue0) band8 //timedelay 3
  (
  .antennaI(antennaI[7]),
  .mask(mask[0]),
  .antennaOw(antennaOw[7]),
  
  .antennaOR(antennaOR7),

  .antennaBP(antennaBP7),

  .trigger_shifter(trigger_shifter),
  .clk_r2(clk_r2),
  .reset(reset),

  .antennaS(antennaS[7]),

  //  .tick(tick),
  .count_1M(count_1M),
  .time_stamp_ok(time_stamp_ok)
  );  
  
  
  
  
  
  
  
  
		 ant_trigger ant_trigger(.clk_r2(clk_r2),	.antennaS(antennaS), .triggerAntTH(triggerAntTH),	.resetCounnterValue(resetCounnterValue),.Atrigger(triggerAnt));

endmodule






















module pulseM
  ( 
 //input  wire        sync_rot_a,
  //input  wire        sync_rot_b,
  input  wire [3:0] antennaI,
  //input  wire [3:0] mask,
  output wire [3:0] antennaOw,
  output wire triggerAnt,
  output wire [23:0] antennaOR0,
  output wire [23:0] antennaOR1,
  output wire [23:0] antennaOR2,
  output wire [23:0] antennaOR3,
  output reg [23:0] antennaBP0=0,
  output reg [23:0] antennaBP1=0,
  output reg [23:0] antennaBP2=0,
  output reg [23:0] antennaBP3=0,
  input wire  [3:0] trigger_shifter,
  input  wire       clk_r2,
  input  wire       reset,
  input  wire [7:0] resetCounnterValue,//for Ant. scaler
  input wire [3:0] triggerAntTH,
  output reg tick= 0,
  output wire [3:0]testo
 // input  wire [5:0] timedelay
  );
  parameter T=1;//time delay dt between stations & cables with ofset 2
  parameter timedelay=1;
  parameter resetCounnterValue0=0;
reg  antennaS0=1'b0,antennaS1=1'b0,antennaS2=1'b0,antennaS3=1'b0;
wire [3:0] antennaS;





reg  [30:0]antennaSs0=0;
reg  [30:0]antennaSs1=0;
reg  [30:0]antennaSs2=0;
reg  [30:0]antennaSs3=0;
reg  [1:0]triggerAnt_b=0;
reg  [4:0]triggerAnt0_c=0;
reg  [4:0]triggerAnt1_c=0;
reg  [4:0]triggerAnt2_c=0;
reg  [4:0]triggerAnt3_c=0;

reg  antennaO0=1'b0,antennaO1=1'b0,antennaO2=1'b0,antennaO3=1'b0;
reg  antennaA0=1'b0,antennaA1=1'b0,antennaA2=1'b0,antennaA3=1'b0;
reg [23:0] antennaR0='h000000;
reg [23:0] antennaR1='h000000;
reg [23:0] antennaR2='h000000;
reg [23:0] antennaR3='h000000;
reg [23:0] antennaC0='h000000;
reg [23:0] antennaC1='h000000;
reg [23:0] antennaC2='h000000;
reg [23:0] antennaC3='h000000;
assign antennaOR0=antennaR0;
assign antennaOR1=antennaR1;
assign antennaOR2=antennaR2;
assign antennaOR3=antennaR3;

assign testo[0]=antennaS[2];
assign testo[1]=antennaO2;
reg [1:0] shift='b00;
//reg [7:0] resetCounnterValue;

reg [23:0] count_1M=24'h000000;
reg [7:0] count_pulse_r='h00;
reg [7:0] count_pulse_l='h00;
reg [7:0] count_pulse_u='h00;
reg [7:0] count_pulse_d='h00;

always@(posedge clk_r2)
begin
if(antennaSs0[0])triggerAnt0_c<=0;
else if(triggerAnt0_c<'d30)triggerAnt0_c<=triggerAnt0_c+1;
if(antennaSs1[0])triggerAnt1_c<=0;
else if(triggerAnt1_c<'d30)triggerAnt1_c<=triggerAnt1_c+1;
if(antennaSs2[0])triggerAnt2_c<=0;
else if(triggerAnt2_c<'d30)triggerAnt2_c<=triggerAnt2_c+1;
if(antennaSs3[0])triggerAnt3_c<=0;
else if(triggerAnt3_c<'d30)triggerAnt3_c<=triggerAnt3_c+1;
end

always@(posedge clk_r2)
begin
	if(antennaSs0[0])antennaSs0[29]<=1;
	else if(triggerAnt0_c>'d20)antennaSs0[29]<=0;
	if(antennaSs0[29])antennaSs0[30]<=1;
	else antennaSs0[30]<=antennaS[0];
end

always@(posedge clk_r2)
begin	
	if(antennaSs1[0])antennaSs1[29]<=1;
	else if(triggerAnt1_c>'d20)antennaSs1[29]<=0;
	if(antennaSs1[29])antennaSs1[30]<=1;
	else antennaSs1[30]<=antennaS[1];
end

always@(posedge clk_r2)
begin		
	if(antennaSs2[0])antennaSs2[29]<=1;
	else if(triggerAnt2_c>'d20)antennaSs2[29]<=0;
	if(antennaSs2[29])antennaSs2[30]<=1;
	else antennaSs2[30]<=antennaS[2];
end

always@(posedge clk_r2)
begin		
	if(antennaSs3[0])antennaSs3[29]<=1;
	else if(triggerAnt3_c>'d20)antennaSs3[29]<=0;
	if(antennaSs3[29])antennaSs3[30]<=1;
	else antennaSs3[30]<=antennaS[3];
	
end

always@(posedge clk_r2)
begin
	if(trigger_shifter<='h4&&trigger_shifter>'h1)
	begin 
		antennaSs0<=antennaSs0;
		antennaSs1<=antennaSs1;
		antennaSs2<=antennaSs2;
		antennaSs3<=antennaSs3;
	end
	else begin
		antennaSs0[28:1]<=antennaSs0[27:0];antennaSs0[0]<=antennaS0;
		antennaSs1[28:1]<=antennaSs1[27:0];antennaSs1[0]<=antennaS1;
		antennaSs2[28:1]<=antennaSs2[27:0];antennaSs2[0]<=antennaS2;
		antennaSs3[28:1]<=antennaSs3[27:0];antennaSs3[0]<=antennaS3;
		triggerAnt_b[1]<=triggerAnt_b[0];triggerAnt_b[0]<=triggerAnt;
	end
end


	 always@(posedge clk_r2)
begin
  count_1M<=count_1M+1'b1;  
end
 always@(posedge clk_r2)
begin
     
		if(count_1M[23]==0&&shift<2'b11)shift<=2'b11; 
		if(count_1M[23]==1&&shift>2'b00)shift<=shift+2'b11; 
		
end

always@*
begin
 if(antennaI[0])antennaO0<=1;
 else if(count_pulse_r=='h01)antennaO0<=0;
 if(antennaI[0]&&count_pulse_r>='h01&&count_pulse_r<timedelay+resetCounnterValue0)antennaA0<=1;
 else if(count_pulse_r>=timedelay)antennaA0<=0;
 if(antennaO0)antennaS0<=1;
 else if(count_pulse_r>=resetCounnterValue0+timedelay)antennaS0<=0;
end

always@( posedge clk_r2)
begin
  if(trigger_shifter=='h3)begin
  antennaBP0[23:0]<=antennaSs0[23:0];
  antennaBP1[23:0]<=antennaSs1[28:5];
  antennaBP2[23:0]<=antennaSs2[28:5];
  antennaBP3[23:0]<=antennaSs3[28:5];

  
  end
end

always@( posedge clk_r2)
begin

//   if((antennaSs0[0]&~antennaSs0[1])&&~^shift) antennaC0<=antennaC0+1'b1; // 0->1 rising will trigger
     if((antennaSs0[0]&~antennaSs0[1])&&~^shift) antennaC0<=antennaC0+1'b1;
	if(antennaO0&(count_pulse_r>=timedelay+resetCounnterValue0))count_pulse_r<=0;
	 else if (antennaA0==1&&count_pulse_r==timedelay) count_pulse_r<=timedelay;
    else if(count_pulse_r<'h3f)count_pulse_r<=count_pulse_r+1'b1;  
	 
	if(count_1M[23]==1&&shift[1]==0&&shift[0]==1)
			begin 
			antennaC0<='h000000; 
			tick<=0;
		end	
  if(count_1M[23]==1&&shift[1]==1&&shift[0]==0)//
			begin
			//antennaR0[T:0]<=antennaSs0[T:0];
			antennaR0<=antennaC0;
			tick<=1;
			end

end

always@*
begin
if(antennaI[1])antennaO1<=1;
else if(count_pulse_l=='h01)antennaO1<=0;
if(antennaI[1]&&count_pulse_l>='h01&&count_pulse_l<timedelay+resetCounnterValue0)antennaA1<=1;
else if(count_pulse_l>=timedelay)antennaA1<=0;
   if(antennaO1)antennaS1<=1;
	else if(count_pulse_l>=resetCounnterValue0+timedelay)antennaS1<=0;
end

always@(posedge clk_r2)
begin

	
   if((antennaSs1[0]&~antennaSs1[1])&&~^shift) antennaC1<=antennaC1+1'b1;
	if(antennaO1==1&&(count_pulse_l>=timedelay+resetCounnterValue0))count_pulse_l<=0;
	 else if (antennaA1==1&&count_pulse_l==timedelay) count_pulse_l<=timedelay;
    else if(count_pulse_l<'h3f)count_pulse_l<=count_pulse_l+1'b1;  
	 
	if(count_1M[23]==1&&shift[1]==0&&shift[0]==1)
			begin 
			antennaC1<='h000000;
		end	
	if(count_1M[23]==1&&shift[1]==1&&shift[0]==0)//(trigger_shifter=='h3)
			begin
			//antennaR1[T:0]<=antennaSs1[T:0];
			antennaR1<=antennaC1;
			end
			

end

always@*
begin
if(antennaI[2])antennaO2<=1;
else if(count_pulse_u=='h01)antennaO2<=0;
if(antennaI[2]&&count_pulse_u>='h00&&count_pulse_u<timedelay+resetCounnterValue0)antennaA2<=1;
else if(count_pulse_u>=timedelay+1)antennaA2<=0;
   if(antennaO2)antennaS2<=1;
	else if(count_pulse_u>=resetCounnterValue0+timedelay)antennaS2<=0;
end

always@(posedge clk_r2)
begin


   if((antennaSs2[0]&~antennaSs2[1])&&~^shift) antennaC2<=antennaC2+1'b1;
	if(antennaO2==1&&(count_pulse_u>=timedelay+resetCounnterValue0))count_pulse_u<=0;
	 //else if (antennaA2==1&&count_pulse_u==timedelay) count_pulse_u<=timedelay;
    else if(count_pulse_u<'h3f)count_pulse_u<=count_pulse_u+1'b1;  
	 
	if(count_1M[23]==1&&shift[1]==0&&shift[0]==1)
			begin 
			antennaC2<='h000000;
		end	
   if(count_1M[23]==1&&shift[1]==1&&shift[0]==0)//(trigger_shifter=='h3)
			begin
			antennaR2<=antennaC2;
			//antennaR2[T:0]<=antennaSs2[T:0];
			end

end

always@*
begin
if(antennaI[3])antennaO3<=1;
else if(count_pulse_d=='h01)antennaO3<=0;
if(antennaI[3]&&count_pulse_d>='h01&&count_pulse_d<timedelay+resetCounnterValue0)antennaA3<=1;
else if(count_pulse_d>=timedelay)antennaA3<=0;
   if(antennaO3)antennaS3<=1;
	else if(count_pulse_d>=resetCounnterValue0+timedelay)antennaS3<=0;
end

always@(posedge clk_r2)
begin

	
   if((antennaSs3[0]&~antennaSs3[1])&&~^shift) antennaC3<=antennaC3+1'b1;
	if(antennaO3==1&&(count_pulse_d>=timedelay+resetCounnterValue0))count_pulse_d<=0;
	 //else if (antennaA3==1&&count_pulse_d==timedelay) count_pulse_d<=timedelay;
    else if(count_pulse_d<'h3f)count_pulse_d<=count_pulse_d+1'b1;  
	 
 if(count_1M[23]==1&&shift[1]==0&&shift[0]==1)
			begin 
			antennaC3<='h000000;
		end	
 if(count_1M[23]==1&&shift[1]==1&&shift[0]==0)//(trigger_shifter=='h3)
			begin
			antennaR3<=antennaC3;
			//antennaR3[T:0]<=antennaSs3[T:0];
			end
end
		

endmodule

