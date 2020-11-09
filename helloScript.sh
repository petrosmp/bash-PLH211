#! /usr/bin/bash

count=10

if (( $count > 10 ))
then
	echo "The variable is greater than 10"
elif (($count == 10 ))
then
	echo "The variable is equal to 10"
else
	echo "The variable is less than 10"
fi
