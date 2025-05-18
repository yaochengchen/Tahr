#include "Riostream.h"
#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
#include <stdlib.h> 
#include <iomanip>
#include "command.h"
#include "TGraphErrors.h"
#include "TCanvas.h"
#include "TFile.h"
#include "TH1.h"
#include "TMultiGraph.h"

using namespace std;


double Sgn[18]={26,38,54,77,100,127,137,154,173,196,220,243,349,506,715,997,1418,1965};


double get_Volt(int board, int band, int i)
       {
  char *txtname = Form("/home/cyc/Verilog/TAROGE3_FPGA/soft/V_vs_Sgn/V_pp_%dmV/Board%d_Band%d_efficiency_scan.dat", int(Sgn[i]), board, band);//
  
       FILE *fpin;
    fpin = fopen(txtname,"r");
    float a;
    float b;
    double voltage[20]={0};
    double efficiency_count[20]={0};
    double efficiency[20]={0};
    if(!fpin) {cout<<txtname<<" open !ok"<<endl; return 0;}
 
        int p = fscanf(fpin,"%f %f", &a, &b); 
    int N =0;  
    while(1){
        voltage[N]=a; efficiency_count[N]=b;
        p = fscanf(fpin,"%f %f", &a, &b);
        if(p!=2) break;
        N+=1;
            }
    fclose(fpin);
    
    for(int i=N;i>0;i--){
       if(efficiency_count[i]>efficiency_count[i-1]) efficiency_count[i-1] = efficiency_count[i];
                        }
                        
    for(int i=0;i<N+1;i++){
       efficiency[i] = efficiency_count[i]/16543.;
       if(efficiency[i]>1) efficiency[i] = 1;
                        }
        
     int j = N;   
    for(int i=0;i<N+1-1;i++){//
       if((efficiency[i]>=0.8)&&(efficiency[i+1]<=0.8)){j=i;}
                        }   
                        
       double Volt = (voltage[j]+voltage[j+1])/2.;
    
    
    TCanvas* c =new TCanvas("abc","data",1900,1000);
    TGraph * gr = new TGraph(N+1,voltage,efficiency);
    
      char name[100]="";
  sprintf(name,"Board #%d  pol %d  Band %d", board, board/6, band);//;
  gr->SetLineColor(2);
  gr->SetTitle(name);		
  gr->SetMaximum(1.);
  gr->SetMinimum(0);
    char fuck[100]="";
 //   sprintf(fuck,"/home/cyc/Verilog/TAROGE3_FPGA/soft/V_vs_Sgn/V_pp_%dmV/Board_%d__Band_%d__.png", int(Sgn[i]), board, band);                              

 //   gr->Draw();
  //  c->Update();
  //  c->Print(fuck,"png");
  //  delete(c);
    
    return Volt;
    }


int main(int argv,char* argc[]){

double V_vs_Sgn[12][8][18];



  TCanvas* c =new TCanvas("Vpol","data",1900,1000);
TGraph* gr2;




for (int board =1;board<13;board++){
for (int band=1;band<9;band++){
for (int i=0;i<18;i++){

    V_vs_Sgn[board-1][band-1][i] = get_Volt(board,band,i);
    //cout<<V_vs_Sgn[board-1][band-1][i]<<endl;
    					}// i loop
  
    gr2 = new TGraph(18,Sgn,V_vs_Sgn[board-1][band-1]); 


    					
    char txtname[100]="";
  sprintf(txtname,"./V_vs_Sgn/Board%d_Band%d_efficiency_scan.dat", board, band);//
  ofstream file(txtname);  					    					
  		
  		int Nsteps = 1000;
  		double Delta_Sgn = (Sgn[17] - Sgn[0])/double(Nsteps);
  		double Sgn_init = Sgn[0];
  		
  		for(int step=0;step<Nsteps+1;step++){
  		
  		  double Sgn_itl = Sgn_init + Delta_Sgn*step;
  		//    cout<<"fuck "<<Sgn_itl<<endl;    	        
  		  double V_itl = gr2->Eval(Sgn_itl);
  		//  cout<<V_itl<<endl;			
        file<<Sgn_itl<<"  "<<V_itl<<endl;
        									}//step loop
     file.close();
     
 //  char name[100]="";  
 // sprintf(name,"Board #%d  pol %d  Band %d", board, (board-1)/6, band);//;
 // gr2->SetLineColor(2);
//  gr2->SetTitle(name);
//    gr2->Draw("ALP");
//  c->Update();

 //   char fuck[100]="";
//    sprintf(fuck,"/home/cyc/Verilog/TAROGE3_FPGA/soft/V_vs_Sgn/Board_%d__Band_%d__.png", board, band);//

//  c->Print(fuck,"png");
 
                              }//band loop
                                   }//board loop
                       

 
 return 0;
 
}

