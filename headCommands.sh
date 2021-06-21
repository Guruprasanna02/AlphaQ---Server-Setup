#!/bin/bash

y=$(whoami)
scripts=('attendance.sh' 'genMom.sh' 'getMom.sh')

for i in ${scripts[@]}
do
	co=$(echo $i | sed 's/.sh/''/g')
        x=$(find /home/$y -iname $i 2> /dev/null) #Locating the file
        [[ -z "$x" ]] && x=$(echo /root/$i) #For root user (docker)
        sudo cp $x /home/Jay_Jay/ 2> /dev/null #Moving the file to home directory
        sudo setfacl -m u:Jay_Jay:r-x /home/Jay_Jay/$i
        sudo sh -c "echo alias $co=\'/home/Jay_Jay/$i\' >> /home/Jay_Jay/.bashrc"
done
