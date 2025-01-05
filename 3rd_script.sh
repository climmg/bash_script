# creating user and group

#!/bin/bash


echo "Script to create user and group"

read -p "Please enter the username: "  user_name

if id -u  $user_name  > /dev/null 2>&1; then 
    echo "User already exist" && echo "Exiting the script!"
    exit 1

else
   echo "User don't exist yet" && echo "creating user...."
   sleep 2
   sudo useradd -m $user_name
   echo "$user_name has been created" && cat /etc/passwd | grep $user_name
   echo "Adding user to wheel group" && sudo usermod -aG wheel $user_name
   
  

   echo ""
   read -sp "Enter password " password 
       echo "$user_name:$password" | sudo chpasswd
   if [ $? -eq 0 ]; then
       echo "Password successfully set for user $user_name."
    else
       echo "Failed to set password for user $user_name."
   fi 
   
fi


echo ""
echo "Creating group"

read -p "Please enter groupname: " group_name
if getent group $group_name  /dev/null 2>&1; then 
  echo"Group already exist"
  exit 1
else
   echo "creating $group_name" && sleep 2
   sudo groupadd $group_name
   echo "Group has been created" 
   cat /etc/group | grep $group_name

fi

echo "Assigning our user $user_name to group $group_name"  && sleep 2
sudo usermod -g $group_name $user_name 
if [ $? -eq 0 ]; then
    echo "All set!"
else
   "Please check your code and assign user $user_name to $group_name manually"

fi


echo "Creating directory and subdirectory under user $user_name"

DIR=/home/$user_name/Philippines

mkdir $DIR && cd $DIR

mkdir Luzon Visayas Mindanao
cd Luzon && echo "Manila Baguio Pasig" > city.txt
cd ../Visayas && echo "Cebu Bohol Bacolod" > city.txt 
cd ../Mindanao && echo "Davao Cagayan de Oro Zamboanga" > city.txt

# validate of all the directory created
ls -l $DIR
