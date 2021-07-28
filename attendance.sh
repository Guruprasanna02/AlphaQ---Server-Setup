#!/bin/bash

#Downloading attendance.log
echo "Wait for a while..." #Displaying message in terminal for user
wget -o /dev/null -P /home/Jay_Jay/ https://inductions.delta.nitt.edu/sysad-task-1-attendance.log

cut -f 2,3,4 -d '-' /home/Jay_Jay/sysad-task-1-attendance.log | cut -f 1 -d ',' | uniq > /home/Jay_Jay/tempDates.txt #A temporary file(deleted at the end of this script) to get meetdates and create an array

#Getting all usernames in an array
members AlphaQ > /home/Jay_Jay/tempMem.txt
users=()
while read p
do
	for i in p
	do
		users+=($p)
	done
done < /home/Jay_Jay/tempMem.txt
users=("${users[@]/Jay_Jay/}")

#Getting all meetdates in an array
meetDates=()
while read p
do
        meetDates+=($p)
done < /home/Jay_Jay/tempDates.txt
exceed=${#meetDates[@]}
exceed=$[exceed-1]

#Function executed when two dates are passed as parameters
betweenDates(){
	local date1="$1"
	local date2="$2"

	#Printing absentees for the date passed to this function
	getAbsentees(){
		local date="$1"
		echo Absentees on $date -
		grep $date /home/Jay_Jay/sysad-task-1-attendance.log | cut -f 1 -d '-' > /home/Jay_Jay/tempNames.txt #A temporary file to get members present on this date
		present=() #Getting present members' usernames in an array
		while read p
		do
			present+=($p)
		done < /home/Jay_Jay/tempNames.txt
		echo ${users[@]} ${present[@]} | tr ' ' '\n' | sort | uniq -u #Printing absentees
		echo ----------------------
		rm /home/Jay_Jay/tempNames.txt
	}

	if expr "$date1" ">=" "${meetDates[0]}" > /dev/null && expr "$date2" "<=" "${meetDates[$exceed]}" >/dev/null
        then
                for (( z=0; z<$exceed; z++ ))
                do
                        if expr "${meetDates[$z]}" ">=" "$date1" > /dev/null
                        then
                                x=$z
                                break
                        fi
                done
                for (( z=0; z<$exceed; z++ ))
                do
                        if expr "${meetDates[$z]}" ">=" "$date2" > /dev/null
                        then
                                if expr "${meetDates[$z]}" "=" "$date2" > /dev/null
                                then
                                        y=$z
                                        break
                                else
                                        y=$[z-1]
                                        break
                                fi
                        fi
                done
                lim=$[$y+1]
                for (( z=$x; z<$lim; z++ ))
                do
                        getAbsentees ${meetDates[$z]}
                done
        else
                echo Sorry, wrong input.
        fi
}
#Function executed when no parameter is passed
allAbsentees(){
	absentDates(){
		local name="$1"
		echo $name
		grep $name /home/Jay_Jay/sysad-task-1-attendance.log | cut -f 2,3,4 -d '-' | cut -f 1 -d ',' > /home/Jay_Jay/presentDates.txt #Getting dates when this user was present
		abDates=() #Getting dates in an array
		while read p
		do 
			abDates+=($p)
		done < /home/Jay_Jay/presentDates.txt
		x=$(echo ${meetDates[@]} ${abDates[@]} | tr ' ' '\n' | sort | uniq -u)
		[[ -z "$x" ]] && echo "Present for all meets!" || echo ${meetDates[@]} ${abDates[@]} | tr ' ' '\n' | sort | uniq -u
		echo ----------------------
		rm /home/Jay_Jay/presentDates.txt
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

rm /home/Jay_Jay/tempMem.txt
rm /home/Jay_Jay/tempDates.txt
rm /home/Jay_Jay/sysad-task-1-attendance.log
