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

int main(int argv,char* argc[]){//

 int step = 600;
 step = get_start_step();
 
fstream fp_out;
  fp_out.open("get_start_step.txt", ios::out);


fp_out<<step<<endl;
fp_out.close();
}
