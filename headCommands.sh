#!/bin/bash

y=$(whoami)
scripts=('attendance.sh' 'genMom.sh' 'getMom.sh')

aliasing(){
	local sc="$1"
	co=$(echo $sc | sed 's/.sh/''/g')
	x=$(find /home/$y -iname $sc 2> /dev/null) #Locating the file
	[[ -z "$x" ]] && x=$(echo /root/$sc) #For root user (docker)
	sudo cp $x /home/Jay_Jay/ 2> /dev/null #Moving the file to home directory
	sudo setfacl -m u:Jay_Jay:r-x /home/Jay_Jay/$sc
	sudo sh -c "echo alias $co=\'/home/Jay_Jay/$sc\' >> /home/Jay_Jay/.bashrc"

}
for i in ${scripts[@]}
do
	aliasing $i
done
