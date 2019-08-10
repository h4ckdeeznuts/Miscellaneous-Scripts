#!/bin/bash

printf "This is a script for adjusting the screen Brightness"
echo
echo "Run this as sudo!"
echo
read -p "Enter a brightness value betweenn 1 and 4882 :: " brightness
echo

while [ "$brightness" -le 4882 ]
do
	echo "$brightness" > /sys/class/backlight/intel_backlight/brightness
	read -p "Do you want to enable Night Light? If so press 'y', or 'n' to exit this script :: " nightlight

		if [ $nightlight == y ]
		then
			printf "What value do you want to set? Recommended is 3400. Any value between 1000 and 4000 KCal is acceptable."
			read -p "\nEnter your choice: " choice
			redshift -P -O "$choice" 2>&1 /dev/null

		elif [ $nightlight == n ]
		then
			echo "Bye!"
			redshift -x 1> /dev/null
			break
		else
			echo "Wrong Choice, Press y(YES) n(NO)"
			break
		fi
exit 0
done

