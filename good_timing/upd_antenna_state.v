module udp_antenna_state(
input wire [7:0] antennaS, input wire [3:0] triggerAntTH, output reg AtriggerI
            );

wire b1;
wire b2;
wire b3;
wire b4;
wire b5;
wire b6;
wire b7;
wire b8;


assign b1 = antennaS[0];
assign b2 = antennaS[1];
assign b3 = antennaS[2];
assign b4 = antennaS[3];
assign b5 = antennaS[4];
assign b6 = antennaS[5];
assign b7 = antennaS[6];
assign b8 = antennaS[7];


wire y1;
wire y2;
wire y3;
wire y4;
wire y5;
wire y6;
wire y7;
wire y8;


eight_of_eight_band_coin   i1_eight_of_eight_band_coin(y8, b1, b2, b3, b4, b5, b6, b7, b8);
seven_of_eight_band_coin   i1_seven_of_eight_band_coin(y7, b1, b2, b3, b4, b5, b6, b7, b8);
six_of_eight_band_coin   i1_six_of_eight_band_coin(y6, b1, b2, b3, b4, b5, b6, b7, b8);
five_of_eight_band_coin   i1_five_of_eight_band_coin(y5, b1, b2, b3, b4, b5, b6, b7, b8);

four_of_eight_band_coin   i1_four_of_eight_band_coin(y4, b1, b2, b3, b4, b5, b6, b7, b8);
three_of_eight_band_coin   i1_three_of_eight_band_coin(y3, b1, b2, b3, b4, b5, b6, b7, b8);
two_of_eight_band_coin   i1_two_of_eight_band_coin(y2, b1, b2, b3, b4, b5, b6, b7, b8);
one_of_eight_band_coin   i1_one_of_eight_band_coin(y1, b1, b2, b3, b4, b5, b6, b7, b8);

 always@*
begin
case (triggerAntTH)
0: AtriggerI <= y1;
1: AtriggerI <= y2;
2: AtriggerI <= y3;
3: AtriggerI <= y4;
4: AtriggerI <= y5;
5: AtriggerI <= y6;
6: AtriggerI <= y7;
7: AtriggerI <= y8;


endcase
end  
    



endmodule
   
// END OF udp_antenna_state.v FILE ***************************************************













primitive eight_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

     1         1         1          1        1         1         1          1      :       1;    // 8/8
       
                       
     endtable
endprimitive
    
// END OF eight_of_eight_band_coin.v FILE ***************************************************














primitive seven_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

     ?         1         1          1        1         1         1          1      :       1;    // 7/8
     1         ?         1          1        1         1         1          1      :       1;
     1         1         ?          1        1         1         1          1      :       1;
     1         1         1          ?        1         1         1          1      :       1;
     1         1         1          1        ?         1         1          1      :       1;
     1         1         1          1        1         ?         1          1      :       1;
     1         1         1          1        1         1         ?          1      :       1;
     1         1         1          1        1         1         1          ?      :       1;      
                       
     endtable
endprimitive
    
// END OF seven_of_eight_band_coin.v FILE ***************************************************







primitive six_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

     ?         ?         1          1        1         1         1          1      :       1;    // 6/8
     ?         1         ?          1        1         1         1          1      :       1;
     ?         1         1          ?        1         1         1          1      :       1;     
     ?         1         1          1        ?         1         1          1      :       1;     
     ?         1         1          1        1         ?         1          1      :       1;     
     ?         1         1          1        1         1         ?          1      :       1;    
     ?         1         1          1        1         1         1          ?      :       1;     
     1         ?         ?          1        1         1         1          1      :       1;     
     1         ?         1          ?        1         1         1          1      :       1;     
     1         ?         1          1        ?         1         1          1      :       1;            
     1         ?         1          1        1         ?         1          1      :       1;
     1         ?         1          1        1         1         ?          1      :       1;     
     1         ?         1          1        1         1         1          ?      :       1;     
     1         1         ?          ?        1         1         1          1      :       1;     
     1         1         ?          1        ?         1         1          1      :       1; 
     1         1         ?          1        1         ?         1          1      :       1; 
     1         1         ?          1        1         1         ?          1      :       1; 
     1         1         ?          1        1         1         1          ?      :       1; 
     1         1         1          ?        ?         1         1          1      :       1;     
     1         1         1          ?        1         ?         1          1      :       1;      
     1         1         1          ?        1         1         ?          1      :       1;       
     1         1         1          ?        1         1         1          ?      :       1;  
     1         1         1          1        ?         ?         1          1      :       1;     
     1         1         1          1        ?         1         ?          1      :       1;
     1         1         1          1        ?         1         1          ?      :       1;
     1         1         1          1        1         ?         ?          1      :       1;
     1         1         1          1        1         ?         1          ?      :       1;
     1         1         1          1        1         1         ?          ?      :       1;


                            
     endtable
endprimitive
    
// END OF six_of_eight_band_coin.v FILE ***************************************************








primitive five_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

       ?       ?       ?       1       1       1       1       1       :       1;//5/8
       ?       ?       1       ?       1       1       1       1       :       1;
       ?       ?       1       1       ?       1       1       1       :       1;
       ?       ?       1       1       1       ?       1       1       :       1;
       ?       ?       1       1       1       1       ?       1       :       1;
       ?       ?       1       1       1       1       1       ?       :       1;
       ?       1       ?       ?       1       1       1       1       :       1;
       ?       1       ?       1       ?       1       1       1       :       1;
       ?       1       ?       1       1       ?       1       1       :       1;
       ?       1       ?       1       1       1       ?       1       :       1;
       ?       1       ?       1       1       1       1       ?       :       1;
       ?       1       1       ?       ?       1       1       1       :       1;
       ?       1       1       ?       1       ?       1       1       :       1;
       ?       1       1       ?       1       1       ?       1       :       1;
       ?       1       1       ?       1       1       1       ?       :       1;
       ?       1       1       1       ?       ?       1       1       :       1;
       ?       1       1       1       ?       1       ?       1       :       1;
       ?       1       1       1       ?       1       1       ?       :       1;
       ?       1       1       1       1       ?       ?       1       :       1;
       ?       1       1       1       1       ?       1       ?       :       1;
       ?       1       1       1       1       1       ?       ?       :       1;
       1       ?       ?       ?       1       1       1       1       :       1;
       1       ?       ?       1       ?       1       1       1       :       1;
       1       ?       ?       1       1       ?       1       1       :       1;
       1       ?       ?       1       1       1       ?       1       :       1;
       1       ?       ?       1       1       1       1       ?       :       1;
       1       ?       1       ?       ?       1       1       1       :       1;
       1       ?       1       ?       1       ?       1       1       :       1;
       1       ?       1       ?       1       1       ?       1       :       1;
       1       ?       1       ?       1       1       1       ?       :       1;
       1       ?       1       1       ?       ?       1       1       :       1;
       1       ?       1       1       ?       1       ?       1       :       1;
       1       ?       1       1       ?       1       1       ?       :       1;
       1       ?       1       1       1       ?       ?       1       :       1;
       1       ?       1       1       1       ?       1       ?       :       1;
       1       ?       1       1       1       1       ?       ?       :       1;
       1       1       ?       ?       ?       1       1       1       :       1;
       1       1       ?       ?       1       ?       1       1       :       1;
       1       1       ?       ?       1       1       ?       1       :       1;
       1       1       ?       ?       1       1       1       ?       :       1;
       1       1       ?       1       ?       ?       1       1       :       1;
       1       1       ?       1       ?       1       ?       1       :       1;
       1       1       ?       1       ?       1       1       ?       :       1;
       1       1       ?       1       1       ?       ?       1       :       1;
       1       1       ?       1       1       ?       1       ?       :       1;
       1       1       ?       1       1       1       ?       ?       :       1;
       1       1       1       ?       ?       ?       1       1       :       1;
       1       1       1       ?       ?       1       ?       1       :       1;
       1       1       1       ?       ?       1       1       ?       :       1;
       1       1       1       ?       1       ?       ?       1       :       1;
       1       1       1       ?       1       ?       1       ?       :       1;
       1       1       1       ?       1       1       ?       ?       :       1;
       1       1       1       1       ?       ?       ?       1       :       1;
       1       1       1       1       ?       ?       1       ?       :       1;
       1       1       1       1       ?       1       ?       ?       :       1;
       1       1       1       1       1       ?       ?       ?       :       1;
                            
     endtable
endprimitive
    
// END OF five_of_eight_band_coin.v FILE ***************************************************








primitive four_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

       ?       ?       ?       ?       1       1       1       1       :       1;//4/8
       ?       ?       ?       1       ?       1       1       1       :       1;
       ?       ?       ?       1       1       ?       1       1       :       1;
       ?       ?       ?       1       1       1       ?       1       :       1;
       ?       ?       ?       1       1       1       1       ?       :       1;
       ?       ?       1       ?       ?       1       1       1       :       1;
       ?       ?       1       ?       1       ?       1       1       :       1;
       ?       ?       1       ?       1       1       ?       1       :       1;
       ?       ?       1       ?       1       1       1       ?       :       1;
       ?       ?       1       1       ?       ?       1       1       :       1;
       ?       ?       1       1       ?       1       ?       1       :       1;
       ?       ?       1       1       ?       1       1       ?       :       1;
       ?       ?       1       1       1       ?       ?       1       :       1;
       ?       ?       1       1       1       ?       1       ?       :       1;
       ?       ?       1       1       1       1       ?       ?       :       1;
       ?       1       ?       ?       ?       1       1       1       :       1;
       ?       1       ?       ?       1       ?       1       1       :       1;
       ?       1       ?       ?       1       1       ?       1       :       1;
       ?       1       ?       ?       1       1       1       ?       :       1;
       ?       1       ?       1       ?       ?       1       1       :       1;
       ?       1       ?       1       ?       1       ?       1       :       1;
       ?       1       ?       1       ?       1       1       ?       :       1;
       ?       1       ?       1       1       ?       ?       1       :       1;
       ?       1       ?       1       1       ?       1       ?       :       1;
       ?       1       ?       1       1       1       ?       ?       :       1;
       ?       1       1       ?       ?       ?       1       1       :       1;
       ?       1       1       ?       ?       1       ?       1       :       1;
       ?       1       1       ?       ?       1       1       ?       :       1;
       ?       1       1       ?       1       ?       ?       1       :       1;
       ?       1       1       ?       1       ?       1       ?       :       1;
       ?       1       1       ?       1       1       ?       ?       :       1;
       ?       1       1       1       ?       ?       ?       1       :       1;
       ?       1       1       1       ?       ?       1       ?       :       1;
       ?       1       1       1       ?       1       ?       ?       :       1;
       ?       1       1       1       1       ?       ?       ?       :       1;
       1       ?       ?       ?       ?       1       1       1       :       1;
       1       ?       ?       ?       1       ?       1       1       :       1;
       1       ?       ?       ?       1       1       ?       1       :       1;
       1       ?       ?       ?       1       1       1       ?       :       1;
       1       ?       ?       1       ?       ?       1       1       :       1;
       1       ?       ?       1       ?       1       ?       1       :       1;
       1       ?       ?       1       ?       1       1       ?       :       1;
       1       ?       ?       1       1       ?       ?       1       :       1;
       1       ?       ?       1       1       ?       1       ?       :       1;
       1       ?       ?       1       1       1       ?       ?       :       1;
       1       ?       1       ?       ?       ?       1       1       :       1;
       1       ?       1       ?       ?       1       ?       1       :       1;
       1       ?       1       ?       ?       1       1       ?       :       1;
       1       ?       1       ?       1       ?       ?       1       :       1;
       1       ?       1       ?       1       ?       1       ?       :       1;
       1       ?       1       ?       1       1       ?       ?       :       1;
       1       ?       1       1       ?       ?       ?       1       :       1;
       1       ?       1       1       ?       ?       1       ?       :       1;
       1       ?       1       1       ?       1       ?       ?       :       1;
       1       ?       1       1       1       ?       ?       ?       :       1;
       1       1       ?       ?       ?       ?       1       1       :       1;
       1       1       ?       ?       ?       1       ?       1       :       1;
       1       1       ?       ?       ?       1       1       ?       :       1;
       1       1       ?       ?       1       ?       ?       1       :       1;
       1       1       ?       ?       1       ?       1       ?       :       1;
       1       1       ?       ?       1       1       ?       ?       :       1;
       1       1       ?       1       ?       ?       ?       1       :       1;
       1       1       ?       1       ?       ?       1       ?       :       1;
       1       1       ?       1       ?       1       ?       ?       :       1;
       1       1       ?       1       1       ?       ?       ?       :       1;
       1       1       1       ?       ?       ?       ?       1       :       1;
       1       1       1       ?       ?       ?       1       ?       :       1;
       1       1       1       ?       ?       1       ?       ?       :       1;
       1       1       1       ?       1       ?       ?       ?       :       1;
       1       1       1       1       ?       ?       ?       ?       :       1;
                            
     endtable
endprimitive
    
// END OF four_of_eight_band_coin.v FILE ***************************************************






primitive three_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

       1       1       1       ?       ?       ?       ?       ?       :       1;//3/8
       1       1       ?       1       ?       ?       ?       ?       :       1;
       1       1       ?       ?       1       ?       ?       ?       :       1;
       1       1       ?       ?       ?       1       ?       ?       :       1;
       1       1       ?       ?       ?       ?       1       ?       :       1;
       1       1       ?       ?       ?       ?       ?       1       :       1;
       1       ?       1       1       ?       ?       ?       ?       :       1;
       1       ?       1       ?       1       ?       ?       ?       :       1;
       1       ?       1       ?       ?       1       ?       ?       :       1;
       1       ?       1       ?       ?       ?       1       ?       :       1;
       1       ?       1       ?       ?       ?       ?       1       :       1;
       1       ?       ?       1       1       ?       ?       ?       :       1;
       1       ?       ?       1       ?       1       ?       ?       :       1;
       1       ?       ?       1       ?       ?       1       ?       :       1;
       1       ?       ?       1       ?       ?       ?       1       :       1;
       1       ?       ?       ?       1       1       ?       ?       :       1;
       1       ?       ?       ?       1       ?       1       ?       :       1;
       1       ?       ?       ?       1       ?       ?       1       :       1;
       1       ?       ?       ?       ?       1       1       ?       :       1;
       1       ?       ?       ?       ?       1       ?       1       :       1;
       1       ?       ?       ?       ?       ?       1       1       :       1;
       ?       1       1       1       ?       ?       ?       ?       :       1;
       ?       1       1       ?       1       ?       ?       ?       :       1;
       ?       1       1       ?       ?       1       ?       ?       :       1;
       ?       1       1       ?       ?       ?       1       ?       :       1;
       ?       1       1       ?       ?       ?       ?       1       :       1;
       ?       1       ?       1       1       ?       ?       ?       :       1;
       ?       1       ?       1       ?       1       ?       ?       :       1;
       ?       1       ?       1       ?       ?       1       ?       :       1;
       ?       1       ?       1       ?       ?       ?       1       :       1;
       ?       1       ?       ?       1       1       ?       ?       :       1;
       ?       1       ?       ?       1       ?       1       ?       :       1;
       ?       1       ?       ?       1       ?       ?       1       :       1;
       ?       1       ?       ?       ?       1       1       ?       :       1;
       ?       1       ?       ?       ?       1       ?       1       :       1;
       ?       1       ?       ?       ?       ?       1       1       :       1;
       ?       ?       1       1       1       ?       ?       ?       :       1;
       ?       ?       1       1       ?       1       ?       ?       :       1;
       ?       ?       1       1       ?       ?       1       ?       :       1;
       ?       ?       1       1       ?       ?       ?       1       :       1;
       ?       ?       1       ?       1       1       ?       ?       :       1;
       ?       ?       1       ?       1       ?       1       ?       :       1;
       ?       ?       1       ?       1       ?       ?       1       :       1;
       ?       ?       1       ?       ?       1       1       ?       :       1;
       ?       ?       1       ?       ?       1       ?       1       :       1;
       ?       ?       1       ?       ?       ?       1       1       :       1;
       ?       ?       ?       1       1       1       ?       ?       :       1;
       ?       ?       ?       1       1       ?       1       ?       :       1;
       ?       ?       ?       1       1       ?       ?       1       :       1;
       ?       ?       ?       1       ?       1       1       ?       :       1;
       ?       ?       ?       1       ?       1       ?       1       :       1;
       ?       ?       ?       1       ?       ?       1       1       :       1;
       ?       ?       ?       ?       1       1       1       ?       :       1;
       ?       ?       ?       ?       1       1       ?       1       :       1;
       ?       ?       ?       ?       1       ?       1       1       :       1;
       ?       ?       ?       ?       ?       1       1       1       :       1;
       
     endtable
endprimitive
    
// END OF three_of_eight_band_coin.v FILE ***************************************************





primitive two_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

       1       1       ?       ?       ?       ?       ?       ?       :       1;//2/8
       1       ?       1       ?       ?       ?       ?       ?       :       1;
       1       ?       ?       1       ?       ?       ?       ?       :       1;
       1       ?       ?       ?       1       ?       ?       ?       :       1;
       1       ?       ?       ?       ?       1       ?       ?       :       1;
       1       ?       ?       ?       ?       ?       1       ?       :       1;
       1       ?       ?       ?       ?       ?       ?       1       :       1;
       ?       1       1       ?       ?       ?       ?       ?       :       1;
       ?       1       ?       1       ?       ?       ?       ?       :       1;
       ?       1       ?       ?       1       ?       ?       ?       :       1;
       ?       1       ?       ?       ?       1       ?       ?       :       1;
       ?       1       ?       ?       ?       ?       1       ?       :       1;
       ?       1       ?       ?       ?       ?       ?       1       :       1;
       ?       ?       1       1       ?       ?       ?       ?       :       1;
       ?       ?       1       ?       1       ?       ?       ?       :       1;
       ?       ?       1       ?       ?       1       ?       ?       :       1;
       ?       ?       1       ?       ?       ?       1       ?       :       1;
       ?       ?       1       ?       ?       ?       ?       1       :       1;
       ?       ?       ?       1       1       ?       ?       ?       :       1;
       ?       ?       ?       1       ?       1       ?       ?       :       1;
       ?       ?       ?       1       ?       ?       1       ?       :       1;
       ?       ?       ?       1       ?       ?       ?       1       :       1;
       ?       ?       ?       ?       1       1       ?       ?       :       1;
       ?       ?       ?       ?       1       ?       1       ?       :       1;
       ?       ?       ?       ?       1       ?       ?       1       :       1;
       ?       ?       ?       ?       ?       1       1       ?       :       1;
       ?       ?       ?       ?       ?       1       ?       1       :       1;
       ?       ?       ?       ?       ?       ?       1       1       :       1;


                            
     endtable
endprimitive
    
// END OF two_of_eight_band_coin.v FILE ***************************************************



primitive one_of_eight_band_coin(q,band1, band2, band3, band4, band5, band6, band7, band8);       
    
    output q;

    input band1;
    input band2;
    input band3;
    input band4;
    input band5;
    input band6;
    input band7;
    input band8;
   
    table
        
// band1     band2     band3      band4    band5     band6     band7      band8    :     q(next)

     1         ?         ?          ?        ?         ?         ?          ?      :       1;    // 1/8
     ?         1         ?          ?        ?         ?         ?          ?      :       1;
     ?         ?         1          ?        ?         ?         ?          ?      :       1;
     ?         ?         ?          1        ?         ?         ?          ?      :       1;
     ?         ?         ?          ?        1         ?         ?          ?      :       1;
     ?         ?         ?          ?        ?         1         ?          ?      :       1;
     ?         ?         ?          ?        ?         ?         1          ?      :       1;
     ?         ?         ?          ?        ?         ?         ?          1      :       1;      
                       
     endtable
endprimitive
    
// END OF one_of_eight_band_coin.v FILE ***************************************************


