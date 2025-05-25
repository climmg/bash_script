#!/bin/bash

read -p "Enter the file here: " file_name


if [ -e $file_name ]; then
        echo "File is already exist! Existing code" && exit 1
else
        echo "File don't exist yet" 
        read -p "would you like to create the file? (Y/N) " create_file

        if [[ $create_file == "Y" || $create_file == "y" ]]; then
            echo "Let's create the file $file_name...." && sleep 3
            touch $file_name && echo "$file_name has been created"
            ls -l $file_name

        else
           echo "Exiting the script" 
           exit 1
       fi

fi
