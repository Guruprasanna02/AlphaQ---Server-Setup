#!/bin/bash

#Downloading attendance.log
echo "Wait for a while..." #Displaying message in terminal for user
wget -o /dev/null https://inductions.delta.nitt.edu/sysad-task-1-attendance.log

cut -f 2,3,4 -d '-' sysad-task-1-attendance.log | cut -f 1 -d ',' | uniq > tempDates.txt #A temporary file(deleted at the end of this script) to get meetdates and create an array

#Getting all usernames in an array
members AlphaQ > tempMem.txt
users=()
while read p
do
	for i in p
	do
		users+=($p)
	done
done < tempMem.txt
users=("${users[@]/Jay_Jay/}")

#Getting all meetdates in an array
meetDates=()
while read p
do
        meetDates+=($p)
done < tempDates.txt
exceed=${#meetDates[@]}

#Function executed when two dates are passed as parameters
betweenDates(){
	local date1="$1"
	local date2="$2"

	#Printing absentees for the date passed to this function
	getAbsentees(){
		local date="$1"
		echo Absentees on $date -
		grep $date sysad-task-1-attendance.log | cut -f 1 -d '-' > tempNames.txt #A temporary file to get members present on this date
		present=() #Getting present members' usernames in an array
		while read p
		do
			present+=($p)
		done < tempNames.txt
		echo ${users[@]} ${present[@]} | tr ' ' '\n' | sort | uniq -u #Printing absentees
		echo ----------------------
		rm tempNames.txt
	}

	#Getting the indices of these dates in meetdates array
	x=$(echo ${meetDates[@]/$date1//} | cut -f 1 -d/ | wc -w | tr -d ' ')
	y=$(echo ${meetDates[@]/$date2//} | cut -f 1 -d/ | wc -w | tr -d ' ')
	if [[ $x -eq $exceed || $y -eq $exceed ]] #checking whether meet was there on the date passed as command line paramter
	then
		echo Sorry, wrong input for one of the dates.
	else
		lim=$[$y+1]
		for (( z=$x; z<$lim; z++ ))
		do
	 		getAbsentees ${meetDates[$z]}
		done
	fi
}

#Function executed when no parameter is passed
allAbsentees(){
	absentDates(){
		local name="$1"
		echo $name
		grep $name sysad-task-1-attendance.log | cut -f 2,3,4 -d '-' | cut -f 1 -d ',' > presentDates.txt #Getting dates when this user was present
		abDates=() #Getting dates in an array
		while read p
		do 
			abDates+=($p)
		done < presentDates.txt
		x=$(echo ${meetDates[@]} ${abDates[@]} | tr ' ' '\n' | sort | uniq -u)
		[[ -z "$x" ]] && echo "Present for all meets!" || echo ${meetDates[@]} ${abDates[@]} | tr ' ' '\n' | sort | uniq -u
		echo ----------------------
		rm presentDates.txt
	}
        for i in ${users[@]}
	do
		absentDates $i
	done
}

[[ $# -eq 2 ]] && betweenDates $1 $2
[[ $# -eq 0 ]] && allAbsentees
if [ $# -ne 0 -a $# -ne 2 ]
then
       	echo Wrong input, 0 or 2 dates required!
fi

rm tempMem.txt
rm tempDates.txt
rm sysad-task-1-attendance.log
