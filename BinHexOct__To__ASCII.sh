#!/bin/bash

printf "This program will covert Binary, Hex and Octal to its corresponding ASCII Value!"
printf "\nEnter \n\t 1 for Binary to ASCII\n\t 2 for Hex to ASCII\n\t 3 for Octal to ASCII\n"
read v
echo "Your choice is $v"

if [[ "$v" == 1 ]]; then
	printf "Enter the binary value to be converted to ASCII\n"
	read bin
	echo "You entered $bin and your answer is:"
	echo
	echo "$bin" | perl -lape '$_=pack"(B8)*",@F'
	echo

elif [[ "$v" == 2 ]]; then
	printf "Enter the Hexadecimal value to be converted to ASCII, starting with 0x\n"
	read hex
	printf 'You entered $hex which converts to:\n'
	xxd -r <<< $hex 
	echo

elif [[ "$v" == 3 ]]; then
	printf "Enter the octal value to be converted to ASCII \n"
	read oct
	new_oct=$(echo " $oct" | tr ' ' '\\' )
	echo
	printf "$new_oct"
	echo 
fi
