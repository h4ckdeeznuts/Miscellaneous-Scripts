#Brightness_Adjust.sh
#>Tested on Arch Linux
#
#>Run this as sudo, since it writes to the /etc/ dir.
#
#>This is a script to adjust the brightness and also has an option to use the Night-Light feature enabled by 'redshift' cli.
#
#>The brightness adjust method only works for intel based laptops, since I personally use a thinkpad with integrated intel HD 4000 graphics.
#
#>This script can be modified to be used with any other systems, for universal compatibility which will be added in the future and is
#my initial attempt at bash scripting.

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
	read -p "Do you want to enable Night Light? This requires := redshift =: to be installed.
	If so press 'y', or 'n' to exit this script :: " nightlight

		if [ $nightlight == y ]
		then
			printf "What value do you want to set? Recommended is 3400."
			echo " Any value between 1000 and 4000 KCal is acceptable."
			read -p " Enter your choice: " choice
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

