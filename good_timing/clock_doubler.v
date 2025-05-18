`timescale 1 ns/100 ps
module clock_doubler(input clk, output clk_2);
wire d,q;
assign clk_2=clk^d;
assign d=~q;
dff_d dff(.q(q),.d(d),.clk(clk_2));
endmodule 

module dff_d (q, d, clk);
    output q;
    input d, clk;
    reg q=0;

    always @(posedge(clk)) q=d;
endmodule