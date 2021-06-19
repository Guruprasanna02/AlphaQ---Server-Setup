#!/bin/bash

y=$(whoami)
x=$(find /home/$y -iname schedule.bash 2> /dev/null) #Locating the file
if [ -z "$x" ]
then #For root user (docker)
    chmod 770 /root/schedule.bash
    echo alias schedule=\'/root/schedule.bash\' >> /root/.bashrc
else
    chmod 770 $x
    echo alias schedule=\'$x\' >> /home/$y/.bashrc
fi

