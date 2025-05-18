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
int ch=atoi(argc[2]);
double voltage=float(atof(argc[3]));
set_threshold(board, ch, voltage);

cout<<"done"<<endl;

return 0;
}
