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

int main(int argv,char* argc[]){


//int board=atoi(argc[1]);
//int ch=atoi(argc[2]);

for (int board =1;board<9;board++){
for (int ch =1;ch<9;ch++){
double rate=get_trigger_rate(board, ch)/0.16777216;
cout<<"Board: "<<board<<"   Band: "<<ch<<endl
    <<"trigger rate: "<<rate<<" Hz"<<endl;

                                    }
                                    }

return 0;
}
