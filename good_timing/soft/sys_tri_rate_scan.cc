
#include "Riostream.h"
#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
//#include <sys/time.h> 
#include <stdlib.h> 
#include <iomanip>
#include "command.h"
#include "TGraphErrors.h"
#include "TCanvas.h"
#include "TFile.h"
#include "TH1.h"
#include "TMultiGraph.h"
//#include "48bands.h"//drawing a plot
using namespace std;


int main(int argv,char* argc[]){// Vi, Vf, Nsteps, Ntimes
     
     int Vi=atoi(argc[1]),Vf=atoi(argc[2]);
     int Nsteps=atoi(argc[3]);
     int Ntimes=atoi(argc[4]);
 double rate[100]={0};
 double threshold_step[100];    
    for(int i=0;i<Nsteps+1;i++){
        int step = Vi+i*int((Vf-Vi)/Nsteps);
        set_threshold_step(step);
        
         threshold_step[i]=step;
                              
         for(int j=0;j<Ntimes;j++){                     
     rate[i]+=get_sys_trigger(0);//0 for trigger rate
     usleep(200000);             
                                   }  
     rate[i]/=double(Ntimes);        
      cout<<threshold_step[i]<<"  "<<rate[i]<<endl;                        
                             } //step loop
                              
        
        

}
