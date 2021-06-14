#!/bin/bash

loc=$(locate -i schedule.bash) #Locating the file after downloading
x=$(echo $loc | sed s/schedule.bash/''/g) #Getting only the  directory where the file is present
cd $x
chmod 770 $loc
echo "alias schedule='./schedule.bash'" >> .bashrc

