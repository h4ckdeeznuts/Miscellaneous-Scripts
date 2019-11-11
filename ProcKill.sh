#!/bin/bash

z="8================3"
echo $z
echo "A program to kill process"
echo $z
echo ""
echo "Enter a process name :- "
read a
b=$(pgrep $a)
if (( b == 0 ))
then
	echo "Either the process does not exist or the name isn't valid!"
else
	echo $z
	echo ""
	echo "The process you're trying to kill is-  $a
with a PID of-  $b"
	echo ""
	echo $z
	sudo kill $b
fi
exit
