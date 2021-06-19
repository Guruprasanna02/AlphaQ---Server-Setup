#!/bin/bash

y=$(whoami)
x=$(find /home/$y -iname genuser.bash 2> /dev/null) #Locating the file
if [ -z "$x" ]
then #For root user (docker)
    chmod 770 /root/genuser.bash 
    echo alias genUser=\'/root/genuser.bash\' >> /root/.bashrc
else 
    chmod 770 $x 
    echo alias genUser=\'$x\' >> /home/$y/.bashrc
fi
