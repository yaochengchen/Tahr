always@(posedge clk_r2)
begin

if(RxD_data_readyt)
shiftert<=2'b11;
if(shiftert>2'b00)
shiftert<=shiftert+2'b11;
end

always@(posedge clk_r)
begin

if(RxD_data_ready)
shifter<=2'b11;
if(shifter>2'b00)
shifter<=shifter+2'b11;
end

always@(posedge clk_r2)
begin
	if(RxD_data_readyt&&RxD_datat==run)RxD_data_statet<=1'b1;
	else begin RxD_data_statet<=1'b0;end
end

always@(posedge clk_r)
begin
if(RxD_data_ready)
begin
	case(RxD_data)
	  stop:
		begin RxD_data_state<=4'h0;	end			
	  run:
		begin RxD_data_state<=4'h1;	end			
	  init:
		begin RxD_data_state<=4'h2;	end	

	  set_threshold:
		begin RxD_data_state<=4'h3;	end
	
	  timedelayR1: 
		begin RxD_data_state<=4'h4;	end
	  trigger_stateV: 
		begin RxD_data_state<=4'h5;	end
	  trigger_stateH: 
		begin RxD_data_state<=4'h6;	end	 
	  p_period: 
		begin RxD_data_state<=4'h7;	end//change repeaterTime
	 
	  set_coincidence: 
		begin RxD_data_state<=4'h8;	end
	  set_antTH:	
		begin RxD_data_state<=4'h9;	end
	
	  R_duration_time:
		begin RxD_data_state<=4'ha;	end
	  R_rate:
		begin RxD_data_state<=4'hb;	end			
	  Set_channel:
		begin RxD_data_state<=4'hc;	end
	  duration: 
		begin RxD_data_state<=4'hd;	end	
	  return_antTH:
		begin RxD_data_state<=4'he;	end	
	endcase

end

if(~shifter[1]&shifter[0]&&RxD_data==end_command)RxD_data_state<=4'hf;	

end

always@(negedge clk_r)
begin

 if(RxD_data_state=='h0)mode<=7'b0000000;//stop

if(RxD_data==end_command&&shifter[1]&shifter[0])
 begin

 if(RxD_data_state=='h1)//run
   begin
	mode<=char[6:0];
   end

 if(RxD_data_state=='hb)//R_rate
	begin 
	
	channel<=char[7:4];
	mask<=char[3:0];
	end
	
	
 if(RxD_data_state=='hc)//Set_channel
	begin 
	channel_mask<=char_mask[11:8];
	band_mask<=char_mask[7:0];
	end
	
	
 if(RxD_data_state=='hd)//duration
 begin pulse_duration_time<=char;end

 if(RxD_data_state=='h8)//set_coincidence
 triggerTH<=char[5:0];

 if(RxD_data_state=='h9)//set_antTH
 triggerAntTH<=char[3:0];	


 if(RxD_data_state=='h2)//init
  begin 
	reset<=1;
	pulse_duration_time<=pulse_duration_time0;
	mask<='hf;
	triggerTH<=6'h3;
	mode<=7'b0000101;
	//clkscaler<=1;
	triggerAntTH<='h3;

	channel1Vmask<='hff; channel2Vmask<='hff; channel3Vmask<='hff;
	channel4Vmask<='hff;

	channel1Hmask<='hff; channel2Hmask<='hff; channel3Hmask<='hff;
	channel4Hmask<='hff;

  end
  if(RxD_data_state=='h3)//set_threshold
	begin
		if(threshold[27]=='b0&&threshold[26]=='b0)begin th0switch<='b1; th1switch<=0; th2switch<=0;end
		if(threshold[27]=='b0&&threshold[26]=='b1)begin th1switch<='b1; th0switch<=0; th2switch<=0;end
		if(threshold[27]=='b1&&threshold[26]=='b0)begin th2switch<='b1; th0switch<=0; th1switch<=0;end
	end
end
	
 if(~shifter_01M[1]&shifter_01M[0])begin th1switch<='b0; th0switch<=0; th2switch<=0; end
 
 if(shifter[1]&~shifter[0]&&RxD_data==end_command)reset<=0;
 
 if(shifter[1]&~shifter[0]&&RxD_data==end_command&&RxD_data_state=='hc)begin
	case(channel_mask)

	  4'b0000  : channel1Hmask<=band_mask;
	  4'b0010  : channel2Hmask<=band_mask;
	  4'b0100  : channel3Hmask<=band_mask;
	  4'b0110  : channel4Hmask<=band_mask;


	  4'b0001  : channel1Vmask<=band_mask;
	  4'b0011  : channel2Vmask<=band_mask;
	  4'b0101  : channel3Vmask<=band_mask;
	  4'b0111  : channel4Vmask<=band_mask;

	  
   endcase
	end


end
