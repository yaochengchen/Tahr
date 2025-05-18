	 reg [3:0] RxD_data_state=4'hf;
	 reg RxD_data_statet=1'b0;

      reg [7:0] channel1Vmask='hff;
 	  reg [7:0] channel2Vmask='hff;
	  reg [7:0] channel3Vmask='hff;
	  reg [7:0] channel4Vmask='hff;


      reg [7:0] channel1Hmask='hff;
 	  reg [7:0] channel2Hmask='hff;
	  reg [7:0] channel3Hmask='hff;
	  reg [7:0] channel4Hmask='hff;


	  //reg [3:0] triggermask='hf;

	
	 reg [3:0] channel='h0;// ex 0000 Ant. No. 000  H pol 0011 Ant. No. 001  V pol
	 reg [3:0] mask='hf;
	 reg [3:0] channel_mask='h0;
	 reg [7:0] band_mask='hff;
	 
	 
	 reg triggerGH=1'b0;
	 reg triggerGV=1'b0;
	 reg triggervH=1'b0;
	 reg triggervV=1'b0;
	 reg triggerIH=1'b0;
	 reg triggerIV=1'b0;
//	 reg vetoSV=1'b0;
//	 reg vetoSH=1'b0;
	 reg triggerLast=1'b0;
//	 reg triggerG=1'b0;
	 reg triggerINFOswitch=0;
	 reg txtSatrtEnd=1;
	 //assign triggerG=triggerGH|triggerGV;///Hpol Vpol trigger
	 reg [6:0] mode=7'b0000101;
	 wire [3:0] triggerInfo;
	 assign triggerInfo = mode[6:3];
	 


	 
	 reg lock=1'b0;

	 parameter enter  ='h0a;
	 parameter countt =9'b110110011;//ClkFrequency = 50000000; Baud = 115200;
	 reg TxData='b0;
	 assign TxDat=TxData;

	 reg [47:0] rchar=48'b0;
	 reg [239:0] rcharT=240'b0;
	 reg Rstate='b0;
	 reg Rstatet='b0;

	 assign dataout[7:6]=2'b00;
	 reg endR='b0;
	 assign dataout[5]=endR;//00110000 is 48 transfered data should be 0 at first and huiche 00001010 for last
	 assign dataout[4]=endR;
	 assign dataout[3]=~endR;
	 assign dataout[2]=0;
	 assign dataout[1]=~endR;
     assign dataout[0]=rchar[47];

	 assign dataoutT[7:6]=2'b00;
	 reg endRT='b0;
	 reg [3:0] dat_hex='h0;
	 assign dataoutT[5]=endRT;
	 assign dataoutT[4]=endRT;
	 assign dataoutT[3]=dat_hex[3];//~endRT;
	 assign dataoutT[2]=dat_hex[2];//~endRT;//0;
	 assign dataoutT[1]=dat_hex[1];//0;//~endR;
	 assign dataoutT[0]=dat_hex[0];


	 

	 reg [8:0] counter_tx='h00;
	 reg [3:0] counter_txO='h0;
	 reg [5:0] counter_txO2='b000000;
	 reg [1:0] shifter_tx='b00;
	 
	 reg [8:0] counter_txt='h00;
	 reg [3:0] counter_txOt='h0;
	 reg [5:0] counter_txO2t=0;
	 reg [1:0] shifter_txt='b00;
	 reg [27:0] repeater='h0000000;
	 reg [27:0] repeaterR='h0000000;
	 reg [27:0] repeaterTO='h0000000;
	 reg [27:0] repeaterPeriod=28'h04C4B3F;
	 reg [27:0] repeaterPeriod_=28'h04C4B3F;
	 reg [27:0] repeaterTime=28'h04C4B3F;
	 reg [27:0] repeaterTime_=28'h04C4B3F;
	 

	/////PPS trigger internal external//////
	 reg risingT=1'b0;
	 reg risingT2=0;
	// reg buffer=0;
	 wire triggerI;
	 assign triggerI=(triggerIH|triggerIV);

	 assign trigger=triggerLast&lock;
	 //always@(negedge clk)
	   //begin 
		  // buffer<=pps;
		  // buffer<=repeater[25];
	   //end
			 wire [3:0]triggerC;
    assign triggerC[0]=triggerI;//trigger rate
	 assign triggerC[1]=pps&triggerI;//trigger efficiency
	 assign triggerC[2]=(~(|repeaterR[27:3]))&triggerI;
		//////////////////////////////////////////////////////
///////////////////////     clock    ////////////////////////////////////
      //////////////////////////////////////////////////////
   wire [12:0]tick;

	wire [7:0] antennaO1Vw;
	wire [7:0] antennaO2Vw;
	wire [7:0] antennaO3Vw;
	wire [7:0] antennaO4Vw;
	

	wire [7:0] antennaO1Hw;
	wire [7:0] antennaO2Hw;
	wire [7:0] antennaO3Hw;
	wire [7:0] antennaO4Hw;

	
	wire [23:0] antennaO1VR1;  wire [23:0] antennaO1VR2;  wire [23:0] antennaO1VR3;  wire [23:0] antennaO1VR4;
	wire [23:0] antennaO1VR5;  wire [23:0] antennaO1VR6;  wire [23:0] antennaO1VR7;  wire [23:0] antennaO1VR0;
	wire [23:0] antennaO2VR1;  wire [23:0] antennaO2VR2;  wire [23:0] antennaO2VR3;  wire [23:0] antennaO2VR4;
	wire [23:0] antennaO2VR5;  wire [23:0] antennaO2VR6;  wire [23:0] antennaO2VR7;  wire [23:0] antennaO2VR0;
	wire [23:0] antennaO3VR1;  wire [23:0] antennaO3VR2;  wire [23:0] antennaO3VR3;  wire [23:0] antennaO3VR4;
	wire [23:0] antennaO3VR5;  wire [23:0] antennaO3VR6;  wire [23:0] antennaO3VR7;  wire [23:0] antennaO3VR0;	
	wire [23:0] antennaO4VR1;  wire [23:0] antennaO4VR2;  wire [23:0] antennaO4VR3;  wire [23:0] antennaO4VR4;
	wire [23:0] antennaO4VR5;  wire [23:0] antennaO4VR6;  wire [23:0] antennaO4VR7;  wire [23:0] antennaO4VR0;	
	

	wire [23:0] antennaO1HR1;  wire [23:0] antennaO1HR2;  wire [23:0] antennaO1HR3;  wire [23:0] antennaO1HR4;
	wire [23:0] antennaO1HR5;  wire [23:0] antennaO1HR6;  wire [23:0] antennaO1HR7;  wire [23:0] antennaO1HR0;
	wire [23:0] antennaO2HR1;  wire [23:0] antennaO2HR2;  wire [23:0] antennaO2HR3;  wire [23:0] antennaO2HR4;
	wire [23:0] antennaO2HR5;  wire [23:0] antennaO2HR6;  wire [23:0] antennaO2HR7;  wire [23:0] antennaO2HR0;
	wire [23:0] antennaO3HR1;  wire [23:0] antennaO3HR2;  wire [23:0] antennaO3HR3;  wire [23:0] antennaO3HR4;
	wire [23:0] antennaO3HR5;  wire [23:0] antennaO3HR6;  wire [23:0] antennaO3HR7;  wire [23:0] antennaO3HR0;	
	wire [23:0] antennaO4HR1;  wire [23:0] antennaO4HR2;  wire [23:0] antennaO4HR3;  wire [23:0] antennaO4HR4;
	wire [23:0] antennaO4HR5;  wire [23:0] antennaO4HR6;  wire [23:0] antennaO4HR7;  wire [23:0] antennaO4HR0;	
		
		
	wire [23:0] triggerVR0;	wire [23:0] triggerVR1;	wire [23:0] triggerVR2;	wire [23:0] triggerVR3;//?

	
	wire [23:0] antennaO1VBP0,antennaO1VBP1,antennaO1VBP2,antennaO1VBP3;// cyc change
	wire [23:0] antennaO1VBP4,antennaO1VBP5,antennaO1VBP6,antennaO1VBP7;
	wire [23:0] antennaO2VBP0,antennaO2VBP1,antennaO2VBP2,antennaO2VBP3;
	wire [23:0] antennaO2VBP4,antennaO2VBP5,antennaO2VBP6,antennaO2VBP7;
	wire [23:0] antennaO3VBP0,antennaO3VBP1,antennaO3VBP2,antennaO3VBP3;
	wire [23:0] antennaO3VBP4,antennaO3VBP5,antennaO3VBP6,antennaO3VBP7;
	wire [23:0] antennaO4VBP0,antennaO4VBP1,antennaO4VBP2,antennaO4VBP3;
	wire [23:0] antennaO4VBP4,antennaO4VBP5,antennaO4VBP6,antennaO4VBP7;


	wire [23:0] antennaO1HBP0,antennaO1HBP1,antennaO1HBP2,antennaO1HBP3;// cyc change
	wire [23:0] antennaO1HBP4,antennaO1HBP5,antennaO1HBP6,antennaO1HBP7;
	wire [23:0] antennaO2HBP0,antennaO2HBP1,antennaO2HBP2,antennaO2HBP3;
	wire [23:0] antennaO2HBP4,antennaO2HBP5,antennaO2HBP6,antennaO2HBP7;
	wire [23:0] antennaO3HBP0,antennaO3HBP1,antennaO3HBP2,antennaO3HBP3;
	wire [23:0] antennaO3HBP4,antennaO3HBP5,antennaO3HBP6,antennaO3HBP7;
	wire [23:0] antennaO4HBP0,antennaO4HBP1,antennaO4HBP2,antennaO4HBP3;
	wire [23:0] antennaO4HBP4,antennaO4HBP5,antennaO4HBP6,antennaO4HBP7;


	 parameter offsetCLK= 2'b00;//clk_r2 ?(clk100) 2'b00:2'b01
	 parameter pulse_duration_time0='h05-offsetCLK;//constant 	
	 reg [7:0] pulse_duration_time='h05;
	 assign resetCounnterValue=pulse_duration_time;
    parameter timedelay_time0='h90;//constant	
	// assign pulse_duration=pulse_duration_time; 
	 	 reg [1:0]repeater_shifter=2'b00;
		 reg [1:0]pps_shifter=2'b00;
	
	wire clk_r;//cyc add
	assign clk_r=clk;

	 
	 parameter stop='h73;//rx data state 'h0
	 parameter run='h72;//rx  data state 'h1 //ascii r
	 parameter init='h69;//rx  data state 'h2
	 
	 parameter set_threshold='h68;////rx  data state 'h3   ascii  h
// 	 parameter set_threshold='h68;////rx  data state 
	 reg [27:0] threshold=28'b000000000000000000000000;		  
	 reg th0switch='b0;
	 reg th1switch='b0;
	 reg th2switch='b0;
	 reg [1:0] shifter_01M='b00;
	 

    parameter timeD=1;//time delay for antennas 
	 //assign timedelay1='h04;
	 //assign timedelay2='h00;
	 //assign timedelay3='h00;
	 parameter set_antTH='h61;//rx data state 'h9 ascii a
	 parameter return_antTH='h41;//rx data state 'he ascii A
	 parameter duration='h74;//rx data state 'hd   ascii t
	 parameter p_period='h70;//rx data state 'h7  ascii p
	 parameter Set_channel='h63;//rx data state 'hc
	 parameter set_coincidence='h6f;//rx data state 'h8 ascii o
	 parameter timedelayR1='h6c;//rx data state 'h4 ascii l
	 parameter trigger_stateV='h6d;//rx data state 'h5
	 parameter trigger_stateH='h6e;//rx data state 'h6
	 parameter R_duration_time='h44;//rx  data state 'ha
	 parameter R_rate='h52;////rx  data state 'hb   ascii R

	 parameter end_command='h65;//rx data state 'hf  ascii e
	 parameter backspace='h08;
	 

	 reg [1:0] shifter='b00;
	 reg [1:0] shiftert='b00;//for writing 
	 reg [3:0] trigger_shifter='h0;
	 reg [7:0] char='h00; 
	 reg [11:0] char_mask='h000;//for band mask



	 
  
	 reg [5:0] triggerNchannelV=5'b00000;	
    reg [5:0] triggerNchannelV_old=5'b00000;	 	
	 reg [5:0] triggerNchannelH=5'b00000;	
    reg [5:0] triggerNchannelH_old=5'b00000;	  
    reg [5:0] triggerTH='h3;//antenna coincidence
	 reg [3:0] triggerAntTH='h6;//band coincidence
	 
	reg timeoutS=0,timeoutstate=0;

	 wire  triggerAnt1V;	 wire  triggerAnt1H;
	 wire  triggerAnt2V;	 wire  triggerAnt2H;
	 wire  triggerAnt3V;	 wire  triggerAnt3H;
	 wire  triggerAnt4V;	 wire  triggerAnt4H;

	 
	 parameter T=23;
    reg [T:0] triggerAnt1VoS=0,triggerAnt2VoS=0,triggerAnt3VoS=0,triggerAnt4VoS=0;
    reg [T:0] triggerAnt1HoS=0,triggerAnt2HoS=0,triggerAnt3HoS=0,triggerAnt4HoS=0;

     reg triggerAnt1VoT;
     reg triggerAnt2VoT;
     reg triggerAnt3VoT;
     reg triggerAnt4VoT;
     
     reg triggerAnt1HoT;
     reg triggerAnt2HoT;
     reg triggerAnt3HoT;
     reg triggerAnt4HoT;
     
     reg [23:0] CountAnt1VoT;
     reg [23:0] CountAnt2VoT;
     reg [23:0] CountAnt3VoT;
     reg [23:0] CountAnt4VoT;
        
     reg [23:0] CountAnt1HoT;
     reg [23:0] CountAnt2HoT;
     reg [23:0] CountAnt3HoT;
     reg [23:0] CountAnt4HoT;
     
     
     reg [T:0] triggerAnt1VoTS=0, triggerAnt2VoTS=0, triggerAnt3VoTS=0, triggerAnt4VoTS=0; 
   
     reg [T:0] triggerAnt1HoTS=0, triggerAnt2HoTS=0, triggerAnt3HoTS=0, triggerAnt4HoTS=0; 
     
     reg [3:0] AntWidth=4'h6;
