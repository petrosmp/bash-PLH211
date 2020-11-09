#!bin/bash

rand() {
  perl -E '$ARGV[0]||=""; $ARGV[0]=int($ARGV[0])||length($ARGV[0]); say join "", int(rand(9)+1)*($ARGV[0]?1:0), map { int(rand(10)) } (0..($ARGV[0]||0)-2)' $1
}





for i in {0..4}
do
	range=25
	number=$((RANDOM % range))
	for ((run=1; run<=number; run++))
	do
	randomnum1=$((RANDOM % 50))
	randomnum2=$((RANDOM % 60))
			if [ $((RANDOM%2)) ]
				then
					echo "-"${randomnum1}":"${randomnum2} >> file${i}.txt
				else
					echo ${randomnum1}":"${randomnum2} >> file${i}.txt
			fi
	done
done
