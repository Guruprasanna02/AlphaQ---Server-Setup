#!/bin/bash

y=$(whoami)
x=$(find /home/$y -iname permit.bash 2> /dev/null) #Locating the file
if [ -z "$x" ]
then #For root user (docker)
    chmod 770 /root/permit.bash
    echo alias permit=\'/root/permit.bash\' >> /root/.bashrc
else
    chmod 770 $x
    echo alias permit=\'$x\' >> /home/$y/.bashrc
fi

