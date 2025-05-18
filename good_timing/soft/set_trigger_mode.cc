#include <iostream>
#include "command.h"
using namespace std;
int main(int argv,char* argc[]){

set_trigger_mode(atoi(argc[1])*100+atoi(argc[2])*10+atoi(argc[3]));
return 0;
}
