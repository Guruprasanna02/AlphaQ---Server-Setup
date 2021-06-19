#!/bin/bash

x=$(find /home -iname attendance.bash 2> /dev/null) #Locating the file after downloading
sudo cp $x /home/Jay_Jay/ 2> /dev/null #Moving the file to home directory
sudo setfacl -m u:Jay_Jay:r-x /home/Jay_Jay/attendance.bash
sudo sh -c "echo alias attendance=\'/home/Jay_Jay/attendance.bash\' >> /home/Jay_Jay/.bashrc"


