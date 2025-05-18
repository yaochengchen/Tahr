
//`timescale 1 ns/100 ps

module clk_01Md(
  input  clk,
  //input  rst_n,
  output o_clk,
  output o_clkd
);

parameter WIDTH = 10;
parameter N     = 950;

reg [WIDTH-1:0] cnt_p=10'b0;
reg [WIDTH-1:0] cnt_d=10'b0;
reg             clk_p=0;
reg             clk_d=0;

assign o_clk = (N == 1) ? clk : clk_p;
assign o_clkd = (N == 1) ? clk : clk_d;
               //(N[0])   ? (clk_p | clk_n) : (clk_p);
        
always@(posedge clk ) begin
 if (cnt_p == (N-1))
    cnt_p <= 0;
  else
    cnt_p <= cnt_p + 1;
end

always@(posedge clk ) begin
 if (cnt_p < (N>>1))
    clk_p <= 1;
  else
    clk_p <= 0;    
end

always@(posedge clk ) begin
if (cnt_d == (N-1))
    cnt_d <= 0;
  else
    cnt_d <= cnt_d + 1;
end

always@(posedge clk ) begin
 if ((cnt_d <= ((N>>1)+'d240))&&(cnt_d>='d240))
    clk_d <= 1;
  else
    clk_d <= 0;
end

//I2C I2C_0(o_clk,rst_n,start,SCL,SDA);

endmodule// divn.v