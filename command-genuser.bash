#!/bin/bash

loc=$(locate -i genuser.bash) #Locating the file after downloading
x=$(echo $loc | sed s/genuser.bash/''/g) #getting only the directory of the file
sudo cd $x
sudo chmod 770 $loc
sudo sh -c "echo "alias genUser='./genuser.bash'" >> .bashrc"
