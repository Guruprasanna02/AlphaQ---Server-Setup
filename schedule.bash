#!/bin/bash

#Downloading future.txt
echo "wait for a while..."
wget -o /dev/null https://inductions.delta.nitt.edu/sysad-task-1-future.txt

users=`members AlphaQ`

#getting today's date
dat=$(echo `date +"%Y-%m-%d"`)

#Reading the future.txt file for meeting dates line by line
while read meetDates
do
	onlyDate=$(echo $meetDates | awk '{print $1}')
	#Checking whether there is a meet today
	if [ "$onlyDate" = "$dat" ]
	then
		#Getting meeting time and writing in schedule.txt of all Aplha Q users if there is a meet
		onlyTime=$(echo $meetDates | awk '{print $2}')
		for i in ${users[@]}
		do
			sudo sh -c "echo 'Date\t\tTime\n$onlyDate\t$onlyTime' > /home/$i/schedule.txt"
		done
	else 
		for i in ${users[@]}
		do
			sudo touch /home/$i/schedule.txt
		done
	fi	
done < sysad-task-1-future.txt

rm sysad-task-1-future.txt
