#!/bin/bash

y=$(whoami)
x=$(find /home/$y -iname genuser.bash 2> /dev/null) #Locating the file 
chmod 770 $x 
if [ $y = "root" ] #Aliasing the command with the user currently working
then
	echo alias genUser=\'$x\' >> /root/.bashrc
else
	echo alias genUser=\'$x\' >> /home/$y/.bashrc
fi
