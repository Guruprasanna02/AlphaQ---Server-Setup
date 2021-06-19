#!/bin/bash

y=$(whoami)
x=$(find /home/$y -iname genmom.bash 2> /dev/null) #Locating the file
[[ -z "$x" ]] && x=$(echo /root/genmom.bash) #For root user (docker)
sudo cp $x /home/Jay_Jay/ 2> /dev/null #Moving the file to home directory
sudo setfacl -m u:Jay_Jay:r-x /home/Jay_Jay/genmom.bash
sudo sh -c "echo alias genMom=\'/home/Jay_Jay/genmom.bash\' >> /home/Jay_Jay/.bashrc"

