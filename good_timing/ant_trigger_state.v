
module ant_trigger(
input wire clk_r2,
input wire [7:0] antennaS,
input wire [3:0] triggerAntTH,
input wire [7:0] resetCounnterValue,
output wire Atrigger,
output wire [3:0] antennaSw
);

	   parameter timedelay=1;
		
reg  antennaS0=1'b0;
reg  antennaO0=0;
reg  antennaA0=0;
	
assign Atrigger=antennaS0;
reg [1:0] shift='b00;


reg [23:0] count_1M=24'h000000;
reg [7:0] count_pulse_r='h00;
reg AtriggerI=0;
reg [3:0] gate=0;
reg  delay_pulse_r='b0;

wire AtriggerI_w;

udp_antenna_state udp_antenna_state(
.antennaS(antennaS[7:0]), .triggerAntTH(triggerAntTH[3:0]), .AtriggerI(AtriggerI_w)
				   );
 always@*
begin
AtriggerI<=AtriggerI_w;
end


	
	always@*
begin
 if(AtriggerI==1&(count_pulse_r>resetCounnterValue))antennaO0<=1;
 else if(count_pulse_r>='h01)antennaO0<=0;
 
 if(AtriggerI&count_pulse_r>='h01&&count_pulse_r<resetCounnterValue)antennaA0<=1;
 else if (~antennaO0)antennaA0<=0;
end

always@(posedge clk_r2)
begin
		if(AtriggerI)antennaS0<=1;
		else if(count_pulse_r>=resetCounnterValue+timedelay)antennaS0<=0;
		
end

always@(posedge clk_r2)
begin	
	if(antennaO0==1&&(count_pulse_r>resetCounnterValue))count_pulse_r<=0;
	 else if (antennaA0==1&&count_pulse_r>=timedelay) count_pulse_r<=timedelay;
    else if(count_pulse_r<'h3f)count_pulse_r<=count_pulse_r+1'b1;
	 

end

endmodule







