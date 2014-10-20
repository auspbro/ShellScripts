#!/bin/bash
# sudo rm -rf /opt/sdt
sudo mkdir -p /opt/sdt/SH_FVS/response
sudo mkdir -p /opt/sdt/SH_FVS/request
sudo mkdir -p /opt/sdt/SH_FVS/result
sudo mkdir -p /opt/sdt/SH_FVS/resp4result
sudo mkdir -p /opt/sdt/SH_Monitor/Handshake2
sudo mkdir -p /opt/sdt/SH_Monitor/HandResp2
sudo mkdir -p /opt/sdt/SH_TM/Request
sudo mkdir -p /opt/sdt/SH_TM/Response
sudo mkdir -p /opt/sdt/SH_BONDING/Request
sudo mkdir -p /opt/sdt/SH_BONDING/Response
sudo mkdir -p /opt/sdt/SH_SERVICE/Request
sudo mkdir -p /opt/sdt/SH_SERVICE/Response
sudo chmod -R 777 /opt/sdt

#sudo mkdir -o /media/shopfloorlg
sudo chmod -R 777 /media/shopfloorlg

# -----------------------------------------
#             Offline Test only
# -----------------------------------------
#        Test Only - AutoFeeding by 69
# -----------------------------------------
sudo cp ./response.smt /opt/sdt/SH_FVS/response/response.txt
sudo cp ./response.smtend /opt/sdt/SH_FVS/resp4result/response.txt
sudo cp ./response.runin /opt/sdt/SH_TM/Response/response.txt
sudo cp ./response.finishFA /opt/sdt/SH_Monitor/HandResp2/response.txt
sudo cp ./response.service /opt/sdt/SH_SERVICE/Response/response.txt
sudo cp ./response.lcdbonding /opt/sdt/SH_BONDING/Response/response.txt
exit 0;

# -----------------------------------------
#                 Online
# -----------------------------------------
#                 umount
# -----------------------------------------
## -- SMT
sudo umount /opt/sdt/SH_FVS/request
sudo umount /opt/sdt/SH_FVS/response
sudo umount /opt/sdt/SH_FVS/result
sudo umount /opt/sdt/SH_FVS/resp4result
## -- Runin
sudo umount /opt/sdt/SH_TM/Request
sudo umount /opt/sdt/SH_TM/Response
## -- Finalize
sudo umount /opt/sdt/SH_Monitor/Handshake2
sudo umount /opt/sdt/SH_Monitor/HandResp2
## -- LCD bonding
sudo umount /opt/sdt/SH_BONDING/Request
sudo umount /opt/sdt/SH_BONDING/Response
## -- Service Part
sudo umount /opt/sdt/SH_SERVICE/Request
sudo umount /opt/sdt/SH_SERVICE/Response


# -----------------------------------------
#                 mount
# -----------------------------------------
## -- SMT
sudo mount -t cifs -o username=bekins,password=bekind2,dir_mode=0777,file_mode=0777 //10.10.0.2/WIN/request /opt/sdt/SH_FVS/request
sudo mount -t cifs -o username=bekins,password=bekind2,dir_mode=0777,file_mode=0777 //10.10.0.2/WIN/response /opt/sdt/SH_FVS/response
sudo mount -t cifs -o username=bekins,password=bekind2,dir_mode=0777,file_mode=0777 //10.10.0.2/WIN/result /opt/sdt/SH_FVS/result
sudo mount -t cifs -o username=bekins,password=bekind2,dir_mode=0777,file_mode=0777 //10.10.0.2/WIN/resultresponse /opt/sdt/SH_FVS/resp4result
## -- Runin
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //18.0.0.8/monfly/CustRunIn/Request /opt/sdt/SH_TM/Request
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //18.0.0.8/monfly/CustRunIn/Response /opt/sdt/SH_TM/Response
## -- Finalize
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //18.0.0.8/monfly/CustRunIn/Handshake /opt/sdt/SH_Monitor/Handshake2
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //18.0.0.8/monfly/CustRunIn/HSResponse /opt/sdt/SH_Monitor/HandResp2
## -- LCD bonding
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //89.0.1.4/monitor_base/FFT/Request /opt/sdt/SH_BONDING/Request
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //89.0.1.4/monitor_base/FFT/Response /opt/sdt/SH_BONDING/Response
## -- Service Part
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //18.0.0.8/monflyBase/CustRunIn/Request /opt/sdt/SH_SERVICE/Request
sudo mount -t cifs -o username=win,password=swdl,dir_mode=0777,file_mode=0777 //18.0.0.8/monflyBase/CustRunIn/Response /opt/sdt/SH_SERVICE/Response

