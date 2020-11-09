#!bin/bash

for i in {1..5}; do
	range=15
	number=$((RANDOM % $range))
	for ((run=1; run<=number; run++))
	do
		if [ $((RANDOM%2)) ];then
			fl1=$((RANDOM % 200))
			fl2=$((RANDOM % 9))
			printf "%d.%d\n" $fl1 $fl2 >> statsfile${i}
		else
			fl1=$((RANDOM % 200))
                	fl2=$((RANDOM % 9))
                	printf "-%d.%d\n" $fl1 $fl2 >> statsfile${i}
		fi
	done
done
