# This script will check directory size!

#!/bin/bash

echo -n "Enter your directory: "
read -r dir_1

result=$(du -sh "$dir_1")

echo "Your directory size is: $result"