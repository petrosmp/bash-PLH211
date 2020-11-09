#!bin/bash

maxSum=0 #declare a variable to store the maxSum and set it to 0 (so that the first sum calculated will always be set as maxSum)
maxFile=""
maxCollumn=0
for arg in $*
do
	printf "\nFILE: %s" ${arg}
	collumn=1
	while IFS= read -r line
	do
		num1=${line%:*}
		num2=${line#*:}
		sum=$(($num1+$num2))
		if [ $sum -ge $maxSum ]
		then
			maxSum=$sum
			maxFile=$arg
			maxCollumn=$collumn
		fi
		collumn=$(($collumn+1))
	done < "$arg"
	printf "\nFile %s ended and max sum is %2d\n\n" $arg $maxSum	#not requested, it's here for testing purposes
done
printf "\n\n\n\nFILE: %s, COLLUMN:%d, sum=%2d\n\n" $maxFile $maxCollumn $maxSum

