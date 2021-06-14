#!/bin/bash

#Downloading attendance.log
echo "Wait for a while..." #Displaying message in terminal for user
wget  -o /dev/null https://inductions.delta.nitt.edu/sysad-task-1-attendance.log

#Getting the last second year joined the meet
x=$(grep $1 sysad-task-1-attendance.log | cut -f 1 -d '-' | tac | sed 's/_10/_00/g' | grep '_0' | head -1 | tr -d ' ')

if [ -z $x ]
then
	echo No second year in this meet
else
	case "_00" in
		$x )
			x=$(echo $x | sed 's/_00/_10/g') ;;
	esac
	#Creating a file in the user's home directory and adding some text to i
	y=$(echo "$1_mom")
	echo Add MoM here > /home/$x/$y
	echo "File created succesfully in $x home directory"
fi

rm sysad-task-1-attendance.log
