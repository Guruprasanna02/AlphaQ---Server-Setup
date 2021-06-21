#!/bin/bash

scripts=('genUser.sh' 'permit.sh' 'schedule.sh')
y=$(whoami)

aliasing(){
	local sc="$1"
	co=$(echo $sc | sed 's/.sh/''/g')
	x=$(find /home/$y -iname $sc 2> /dev/null) #Locating the file
	if [ -z "$x" ]
	then #For root user (docker)
	    	chmod 770 /root/$sc
	    	echo alias $co=\'/root/$sc\' >> /root/.bashrc
	else
	    	chmod 770 $x
	    	echo alias $co=\'$x\' >> /home/$y/.bashrc
	fi

}

for i in ${scripts[@]}
do
	aliasing $i
done
