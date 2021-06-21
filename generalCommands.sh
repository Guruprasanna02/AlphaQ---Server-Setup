#!/bin/bash

scripts=('genUser.sh' 'permit.sh' 'schedule.sh')
y=$(whoami)

for i in ${scripts[@]}
do
	co=$(echo $i | sed 's/.sh/''/g')
        x=$(find /home/$y -iname $i 2> /dev/null) #Locating the file
        if [ -z "$x" ]
        then #For root user (docker)
                chmod 770 /root/$i
                echo alias $co=\'/root/$i\' >> /root/.bashrc
        else
                chmod 770 $x
                echo alias $co=\'$x\' >> /home/$y/.bashrc
        fi
done
