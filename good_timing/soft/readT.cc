#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include <iomanip>
#include "command.h"
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
using namespace std;



int main(int argv,char* argc[])
{

double duration;
int rate_counter;
int eff_counter;

readT(duration, rate_counter, eff_counter);

/*
 time_t start, finish;  
 
  
 int rate_counter = 0;
 int eff_counter = 0;
 
  

  
  



 ifstream r_ttyS2("/dev/ttyUSB0");
 ifstream r_ttyS1("/dev/ttyUSB1");
 ofstream w_ttyS1("/dev/ttyUSB1");
 ofstream w_ttyS2("/dev/ttyUSB0");



 start=time(NULL); 
while( 1 ){

double T=readT(r_ttyS1,w_ttyS1,r_ttyS2,w_ttyS2);
if(T!=1) rate_counter ++;
if(T<3.2e-06) eff_counter ++;

 finish=time(NULL);

if( finish>start+2 ) break;
}





  r_ttyS1.close();
  r_ttyS2.close();
  w_ttyS2.close();
  w_ttyS1.close();





double duration = (double)(finish - start);
//cout<<CLOCKS_PER_SEC<<endl;


cout<<duration<<"  "<<rate_counter<<"  "<<eff_counter<<endl;


*/

return 0;
}




