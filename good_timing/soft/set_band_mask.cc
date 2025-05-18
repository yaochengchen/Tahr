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

int board=atoi(argc[1]);
int mask=atoi(argc[2]);

cout<<mask<<endl;

set_band_mask(board,mask);

cout<<"done"<<endl;

return 0;
}
