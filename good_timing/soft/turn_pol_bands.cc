#include <iostream>
#include "command.h"
using namespace std;

int main(int argv,char* argc[]){//pol:0 for V, 1 for H; on_off: 0 for off, 1 for on

int pol = atoi(argc[1]);

bool on_off = atof(argc[2]);

turn_pol_bands(pol,on_off);

cout<<"done"<<endl;

return 0;
}
