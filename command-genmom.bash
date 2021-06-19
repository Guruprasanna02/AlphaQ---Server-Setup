#!/bin/bash

loc=$(find /home -iname genmom.bash 2> /dev/null) #Locating the file after downloading
sudo cp $loc /home/Jay_Jay/ 2> /dev/null #Moving the file to home directory
sudo setfacl -m u:Jay_Jay:r-x /home/Jay_Jay/genmom.bash
sudo sh -c "echo alias genMom=\'/home/Jay_Jay/genmom.bash\' >> /home/Jay_Jay/.bashrc"

