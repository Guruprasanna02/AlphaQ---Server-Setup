#!/bin/bash

loc=$(locate -i permit.bash) #Locating the file after downloading
x=$(echo $loc | sed s/permit.bash/''/g) #Gettng only the directory where the file is present 
cd $x
chmod 770 $loc
echo "alias permit='./permit.bash'" >> .bashrc

