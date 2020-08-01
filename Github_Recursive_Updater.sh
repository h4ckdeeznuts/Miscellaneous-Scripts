#!/bin/bash

# By - Kushagra
# Twitter - h4ckdeeznuts
# Email - shubhamdeeznuts@gmail.com
    
# Use this script to update your entire github repo collection recursively!
    
    # Usage -- bash Github_Recursive_Updater.sh <repo collection's directory name>

[[ $1 == "" ]] && echo "Usage -- bash $0 <repo collection's directory name>" && exit 1

cd $1

k=$(( `ls -l | wc -l`-1 ))

for i in `seq $k`;
do
    cd `ls | sed -n ${i}p`;
    echo ""
    echo " Current Directory ---- `echo $(pwd)` ";
    echo `for i in {1..40}; do echo -n "=="; done`
    echo ""
    git pull -q ;
    cd .. ;
done
