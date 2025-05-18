#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h> 
#include <stdlib.h> 
#include <iomanip>
#include "command.h"
using namespace std;

int main(int argv,char* argc[]){//0 for rate, 1 for efficiency

int indicator = atoi(argc[1]);

double rate = 0;
for(int i=0; i<10; i++){
rate+=get_sys_trigger(indicator);
                        }
rate/=10.;
cout<<"system trigger rate(0)/efficiency(1): "<<indicator<<"   "<<rate<<" Hz"<<endl;

return 0;
}
