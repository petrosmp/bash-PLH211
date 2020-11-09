#!bin/bash

for arg in $*
do
	maxbef=0
	maxaft=0
	lines=0
	while IFS= read -r line
	do
		#firstly, split the float into 2 integers
		beforePoint=${line%.*}
		afterPoint=${line#*.}
		#check if the first int is greater than the first part of the greatest float. If they are equal AND their second parts are equal, or the 2nd part of the line's float is greater than that of the greatest, the greatest is replaced
		if [ $beforePoint -gt $maxbef ]; then
			maxbef=$beforePoint
			maxaft=$afterPoint
		elif [ $beforePoint -eq $maxbef ]; then
			if [ $afterPoint -ge $maxaft ];then
				maxbef=$beforePoint
				maxaft=$afterPoint
			fi
		fi
		#assign the values of the line to minbef and minaft if its the first line
		if [ $lines == 0 ]; then
			minbef=$beforePoint
			minaft=$afterPoint
		fi
		#process same as before, only reversed to work for smallest floats
		if [ $beforePoint -lt $minbef ]; then
                        minbef=$beforePoint
                        minaft=$afterPoint
                elif [ $beforePoint -eq $minbef ]; then
                        if [ $afterPoint -le $minaft ];then
                                minbef=$beforePoint
                                minaft=$afterPoint
                        fi
                fi
		#number of lines goes up by one
		lines=$(($lines+1))
	done < "$arg"
	printf "FILE: %s,\tlines: %d,\tmax=%d.%d,\tmin=%d.%d\n" $arg $lines $maxbef $maxaft $minbef $minaft
done
