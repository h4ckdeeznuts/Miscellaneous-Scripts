#!/bin/bash
# RobustRename.sh
# This script is to be used when renaming a batch of files, eg. for backing up purposes.
# This script will also then aid in reverting the rename of the files.



read -p 'Enter the path of the files to be renamed: ' pathVar
echo
read -p 'Enter the filename(s) with a wild-card character: ' filenameVar
echo
read -p 'Enter renaming keyword: ' renameVar
export $renameVar
echo
read -p 'Do you wish to rename or undo renaming? (  y --> to rename  /  n --> to undo renaming): ' decisionVar
echo

case $decisionVar in
    y)
        echo -e 'You choose to rename...\nRenaming by appending the keyword...'
        ls $pathVar/$filenameVar | xargs -n1 -I{} bash -c "mv {} {}_$renameVar"

        ;;
    n)
        echo 'You choose to undo renaming...'
        for FILE in `ls $pathVar/$filenameVar`
        do
            mv "$FILE" "`echo $FILE|sed "s/_$renameVar//g"`"

        done

        ;;
    *)
        echo 'Wrong choice!'
        ;;
    esac

if [ $? -eq 0 ]; then
    echo 'Success!'
else
    echo 'Something went wrong!'
fi
