#!/bin/bash

showuptime(){
        up=$(uptime -p | cut -c4-)
        since=$(uptime -s)
        cat << EOF
_________
This machine has been up for ${up}
It has been running since ${since}
________

EOF
}
Showuptime
