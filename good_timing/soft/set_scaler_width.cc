#include <iostream>
#include "command.h"
using namespace std;
int main(int argv,char* argc[]){

int width = atoi(argc[1]);
set_scaler_width(width);
return 0;
}
