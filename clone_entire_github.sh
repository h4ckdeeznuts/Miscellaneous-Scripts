#!/bin/sh

for i in $(echo `curl -s "https://github.com/$1?tab=repositories" | grep "name codeRepository" | cut -d '"' -f2 | cut -d '/' -f3`); do git clone https://github.com/$1/$i; done
