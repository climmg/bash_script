#!/bin/bash

# check if file exists in the current directory, if not we will create it

read -p "Please enter a File: " var1

if [ -f $var1 ]; then
    echo "File exist"
    exit 1 

else
    echo "File not found" && echo "Let's create the file"
    echo "creating file……" && sleep 2
    touch $var1 && echo "Done, File created!" 
    ls -l $var1 
    
fi    