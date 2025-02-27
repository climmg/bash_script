# This script will check if apps or service is running
# We use array / list of services 

#!/bin/bash

RUNNING_SERVICES=("ssh" "cron" "atd")


for i in "${RUNNING_SERVICES[@]}"
do
    if systemctl status "$i" | grep "active (running)"; then
       echo "Service $i is running"
    else
       echo "services is not active or enable"
    fi
done
