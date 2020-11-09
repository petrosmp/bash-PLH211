#!bin/bash
alphabet=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
i=1
for num in 8 7 4 2 3 6 1 5 5 6 4 1 3 2  
do
	i=$((i+1))
	prevnum=$((num - i))
	nextnum=$((num + 1))
	echo  "String"${alphabet[prevnum]}"-String"${alphabet[num]}":Number"${num}"-Number"${nextnum} | tee -a input.4col
done

