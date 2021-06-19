#!/bin/bash

y=$(whoami)
x=$(find /home/$y -iname schedule.bash 2> /dev/null) #Locating the file
chmod 770 $x
if [ $y = "root" ] #Aliasing the command with the user currently working
then
        echo alias schedule=\'$x\' >> /root/.bashrc
else
        echo alias schedule=\'$x\' >> /home/$y/.bashrc
fi
