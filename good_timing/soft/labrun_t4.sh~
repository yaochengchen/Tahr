stty -F /dev/ttyS5 cs8 cstopb 115200 -echo
stty -F /dev/ttyS6 cs8 cstopb 115200 -echo

echo ie >/dev/ttyS6 #default
./set_scaler_width 5 # antenna pulse width default is 100 ns


######## set bands thresholds #######

./set_threshold_step 100

#####################################
 
 
 
########## coincidence level###########
antC="4"
bandC="6"
./set_coincidence $antC $bandC
#######################################



#########set mode ############
run="1" #run  1 auto+normal | 0 normal 
pol="0" #pol 1 Vpol | 0 Hpol 
triggerInfo="0" # 0 hitpattern | 1~6 dwB | 7 dwA
#pol triggerInfo: 0 0 
./set_trigger_mode $run $pol $triggerInfo 
##############################









