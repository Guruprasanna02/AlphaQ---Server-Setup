#!/bin/bash

loc=$(find /home -iname getmom.bash 2> /dev/null) #Locating the file after downloading
sudo cp $loc /home/Jay_Jay/ 2> /dev/null #Moving the file to home directory
sudo setfacl -m u:Jay_Jay:r-x /home/Jay_Jay/getmom.bash
sudo sh -c "echo alias getMom=\'/home/Jay_Jay/getmom.bash\' >> /home/Jay_Jay/.bashrc"

