`timescale 1 ns/1 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:35:26 11/28/2013 
// Design Name: 
// Module Name:    top 
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
module top_24bit_R2(  
  input  clk,
  input wire pps,
  output wire [1:0] picoscope,
  input  wire [7:0] antennaI1V,
  input  wire [7:0] antennaI2V,
  input  wire [7:0] antennaI3V,
  input  wire [7:0] antennaI4V,

  input  wire [7:0] antennaI1H,
  input  wire [7:0] antennaI2H,
  input  wire [7:0] antennaI3H,
  input  wire [7:0] antennaI4H,
  output wire clk1muR,
  output wire Tx,
  output wire TxT,
  input wire RxD,
  input wire RxDt,
  output wire SCL0,
  output wire SCL1,

  output wire SDA0,
  output wire SDA1,
 

  output wire [3:0] testo,
  output wire test
    );

	clock_doubler clk_d(.clk(clk),.clk_2(clk_r2));

	wire clk1muR1;

    wire trigger;

	wire [7:0] resetCounnterValue;

	wire resetpulse;

	reg [7:0] TxD_data='h11;
	wire TxDat;

	reg [7:0] TxD_dataT=8'b00110001;	
	wire TxDatT;

	wire [7:0] RxD_data;   
	wire RxD_data_ready;

	wire [7:0] RxD_datat;   
	wire RxD_data_readyt;

	wire [7:0] dataout;
	wire [7:0] dataoutT;

	reg [1:0] TXcounter=2'b00;
	reg [1:0] TXcounterT=2'b00;	
	
	wire TxD_start=(~TXcounter[1]&TXcounter[0]);
	wire TxD_startT=(~TXcounterT[1]&TXcounterT[0]);



assign picoscope[0] = trigger;
assign picoscope[1] = trigger;

 


 //assign testo = RxD_data[7:0];
  
///////////////////////////////////////////  


	always@(negedge clk)
	begin
	 if(TxDat==1)begin  TXcounter<=2'b11;end
	 if(TXcounter>0)begin TXcounter<=TXcounter+'b11;end //TXcounter-1 each time
	end
	
		always@(negedge clk)
	begin
	 if(TxDatT==1)begin  TXcounterT<=2'b11;end
	 if(TXcounterT>0)begin TXcounterT<=TXcounterT+'b11;end
	end
	



	always@( negedge clk)
	begin
		  if(TxDat==1) begin TxD_data<=dataout;end
		  if(TxDatT==1) begin TxD_dataT<=dataoutT;end 
	end

	

	cmd cmd(

	.clk(clk),
	.clk_r2(clk_r2),
	.pps(pps),
	.RxD_data(RxD_data),
	.RxD_data_ready(RxD_data_ready),
	.RxD_datat(RxD_datat),
	.RxD_data_readyt(RxD_data_readyt),
	.TxDat(TxDat),
	.TxDatT(TxDatT),
	.resetCounnterValue(resetCounnterValue),
	.dataout(dataout),
	.dataoutT(dataoutT),
//    .charo(rchar),
	.reset(resetpulse),
	.trigger(trigger),

	
		.antennaI1V(antennaI1V),
		.antennaI2V(antennaI2V),
		.antennaI3V(antennaI3V),
		.antennaI4V(antennaI4V),


		.antennaI1H(antennaI1H),
		.antennaI2H(antennaI2H),
		.antennaI3H(antennaI3H),
		.antennaI4H(antennaI4H),


	.SCL0(SCL0),
	.SCL1(SCL1),

	.SDA0(SDA0),
	.SDA1(SDA1),

	.testo(testo)
	//.test(test)
	);//*/

reg [31:0] fuck_shifter = 8'h00000000;
reg fuck;

always@(posedge clk)
begin
//    if(fuck_shifter==7'h0000000) test<=1'b1;
	if(RxD_data_ready) fuck_shifter<='hffffffff;//fuck<=1'b1;
//	   else fuck<=0;
//	if(fuck) begin fuck_shifter <= 7'h2faf080; test<=0; end
    else if(fuck_shifter>0) fuck_shifter<= fuck_shifter+8'hffffffff;

end

assign test = fuck_shifter[31];


 async_transmitter async_transmitter(	
     .clkRS(clk),
	 .TxD_start(TxD_start),
	 .TxD_data(TxD_data),
	 .TxD(Tx),
	 //.TxD_busy(TxD_busy),
	 .clk1muR(clk1muR)
	 );
 async_transmitter async_transmitter_trigger(	
     .clkRS(clk),
	 .TxD_start(TxD_startT),
	 .TxD_data(TxD_dataT),
	 .TxD(TxT),
	 //.TxD_busy(TxD_busy),
	 .clk1muR(clk1muR1)
	 );
	 
	 
	 
	 wire RxD_endofpacket; 
 async_receiver async_receiver0(
	.clkRS(clk),
	.RxD(RxD),
	.RxD_data_ready (RxD_data_ready),
	.RxD_data(RxD_data)   // data received, valid only (for one clock cycle) when RxD_data_ready is asserted
	//.testo(testo),
	// We also detect if a gap occurs in the received stream of characters
	// That can be useful if multiple characters are sent in burst
	//  so that multiple characters can be treated as a "packet"
	//.RxD_idle(RxD_idle),  // asserted when no data has been received for a while
	//.RxD_endofpacket(RxD_endofpacket)   // asserted for one clock cycle when a packet has been detected (i.e. RxD_idle is going high)
);




async_receiver async_receiverT(
	.clkRS(clk),
	.RxD(RxDt),
	.RxD_data_ready (RxD_data_readyt),
	.RxD_data(RxD_datat)   // data received, valid only (for one clock cycle) when RxD_data_ready is asserted
	//.testo(testo),
	// We also detect if a gap occurs in the received stream of characters
	// That can be useful if multiple characters are sent in burst
	//  so that multiple characters can be treated as a "packet"
	//.RxD_idle(RxD_idle),  // asserted when no data has been received for a while
	//.RxD_endofpacket(RxD_endofpacket)   // asserted for one clock cycle when a packet has been detected (i.e. RxD_idle is going high)
);


endmodule
