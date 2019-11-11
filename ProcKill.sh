#!/bin/bash

z="8================3"
echo $z
echo "A program to kill process"
echo $z
echo ""
echo "Enter a process name :- "
read a
b=$(pgrep $a)
echo $z
echo "The process you're trying to kill is $a with a PID of $b"
echo $z
sudo kill $b

