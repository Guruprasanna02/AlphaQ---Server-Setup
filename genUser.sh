#!/bin/bash

#Creating group for Alpha Q
sudo groupadd AlphaQ

# Displaying message in terminal
echo This might take a while... So sit back and relax!

#Creating groups for each year with resprective domains (2nd, 3rd and 4th)
for (( i=2; i<5; i++ ))
do
        sudo groupadd sysAdYear$i
        sudo groupadd webDevYear$i
        sudo groupadd appDevYear$i
done

#Creating second year users
year2() {
	local i="$1"
	if [ $i -eq 10 ]
	then
		sudo useradd sysAd_$i -m -s /bin/bash -G sysAdYear2,AlphaQ
		echo sysAd_$i:user123 | sudo chpasswd
                sudo useradd appDev_$i -m -s /bin/bash -G appDevYear2,AlphaQ
		echo appDev_$i:user123 | sudo chpasswd
                sudo useradd webDev_$i -m -s /bin/bash -G webDevYear2,AlphaQ
		echo webDev_$i:user123 | sudo chpasswd
	else 
		sudo useradd sysAd_0$i -m -s /bin/bash -G sysAdYear2,AlphaQ
		echo sysAd_0$i:user123 | sudo chpasswd
                sudo useradd appDev_0$i -m -s /bin/bash -G appDevYear2,AlphaQ
		echo appDev_0$i:user123 | sudo chpasswd
                sudo useradd webDev_0$i -m -s /bin/bash -G webDevYear2,AlphaQ
		echo webDev_0$i:user123 | sudo chpasswd
	fi
}

#Creating third year users
year3(){
	local i="$1"
	sudo useradd sysAd_$i -m -s /bin/bash -G sysAdYear3,AlphaQ
	echo sysAd_$i:user123 | sudo chpasswd
        sudo useradd appDev_$i -m -s /bin/bash -G appDevYear3,AlphaQ
	echo appDev_$i:user123 | sudo chpasswd
        sudo useradd webDev_$i -m -s /bin/bash -G webDevYear3,AlphaQ
	echo webDev_$i:user123 | sudo chpasswd
}

#Creating fourth year users
year4(){
        local i="$1"
        sudo useradd sysAd_$i -m -s /bin/bash -G sysAdYear4,AlphaQ
	echo sysAd_$i:user123 | sudo chpasswd
        sudo useradd appDev_$i -m -s /bin/bash -G appDevYear4,AlphaQ
	echo appDev_$i:user123 | sudo chpasswd
        sudo useradd webDev_$i -m -s /bin/bash -G webDevYear4,AlphaQ
	echo webDev_$i:user123 | sudo chpasswd
}

i=1
while [ $i -lt 11 ]
do
	year2 $i
	year3 $[i+10]
	year4 $[i+20]
	i=$[i+1]
done

#Creating Alpha Q head user
sudo useradd Jay_Jay -m -s /bin/bash -g AlphaQ
echo Jay_Jay:user123 | sudo chpasswd

# Message to be displayed in terminal
sudo apt-get install members > /dev/null
echo 
echo Users added successfully ! Here is the list of users added :
members AlphaQ

