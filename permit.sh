#!/bin/bash

year2Permits(){
	local i="$1"
	if [ $i -eq 10 ]
	then
		sudo chmod 700 /home/sysAd_$i
		sudo chmod 700 /home/appDev_$i
		sudo chmod 700 /home/webDev_$i
		sudo setfacl -m g:sysAdYear3:r-x -R /home/sysAd_$i
                sudo setfacl -m g:sysAdYear4:r-x -R /home/sysAd_$i
		sudo setfacl -m u:Jay_Jay:rwx -R /home/sysAd_$i
                sudo setfacl -m g:appDevYear3:r-x -R /home/appDev_$i
                sudo setfacl -m g:appDevYear4:r-x -R /home/appDev_$i
		sudo setfacl -m u:Jay_Jay:rwx -R /home/appDev_$i
                sudo setfacl -m g:webDevYear3:r-x -R /home/webDev_$i
                sudo setfacl -m g:webDevYear4:r-x -R /home/webDev_$i
		sudo setfacl -m u:Jay_Jay:rwx -R /home/webDev_$i
	else 
		sudo chmod 700 /home/sysAd_0$i
                sudo chmod 700 /home/appDev_0$i
                sudo chmod 700 /home/webDev_0$i
                sudo setfacl -m g:sysAdYear3:r-x -R /home/sysAd_0$i
                sudo setfacl -m g:sysAdYear4:r-x -R /home/sysAd_0$i
		sudo setfacl -m u:Jay_Jay:rwx -R /home/sysAd_0$i
                sudo setfacl -m g:appDevYear3:r-x -R /home/appDev_0$i
                sudo setfacl -m g:appDevYear4:r-x -R /home/appDev_0$i
		sudo setfacl -m u:Jay_Jay:rwx -R /home/appDev_0$i
                sudo setfacl -m g:webDevYear3:r-x -R /home/webDev_0$i
                sudo setfacl -m g:webDevYear4:r-x -R /home/webDev_0$i
		sudo setfacl -m u:Jay_Jay:rwx -R /home/webDev_0$i
	fi
}

year3Permits(){
	local i="$1"
	sudo chmod 700 /home/sysAd_$i
        sudo chmod 700 /home/appDev_$i
	sudo chmod 700 /home/webDev_$i
	sudo setfacl -m g:sysAdYear4:r-x -R /home/sysAd_$i
	sudo setfacl -m u:Jay_Jay:rwx -R /home/sysAd_$i
	sudo setfacl -m g:appDevYear4:r-x -R /home/appDev_$i
	sudo setfacl -m u:Jay_Jay:rwx -R /home/appDev_$i
	sudo setfacl -m g:webDevYear4:r-x -R /home/webDev_$i
	sudo setfacl -m u:Jay_Jay:rwx -R /home/webDev_$i
}

year4Permits(){
	local i="$1"
	sudo chmod 700 /home/sysAd_$i
        sudo chmod 700 /home/appDev_$i
        sudo chmod 700 /home/webDev_$i
        sudo setfacl -m u:Jay_Jay:rwx -R /home/sysAd_$i
        sudo setfacl -m u:Jay_Jay:rwx -R /home/appDev_$i
        sudo setfacl -m u:Jay_Jay:rwx -R /home/webDev_$i

}

a=1
while [ $a -lt 11 ]
do
	year2Permits $a
	year3Permits $[a+10]
	year4Permits $[a+20]
	a=$[a+1]
done
