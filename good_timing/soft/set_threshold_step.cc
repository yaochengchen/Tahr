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

int main(int argv,char* argc[]){// step [0,1000]
int step=atoi(argc[1]);

set_threshold_step(step);

return 0;
}
