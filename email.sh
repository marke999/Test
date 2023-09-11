#!/bin/bash

#To prompt login and send to gmail
username=$(whoami)
echo "$username"

echo "$username is now logged-in at $(date +"%m-%d-%Y %r")" | mail -s "Login for $(date +"%m-%d-%Y")" mark.ramesessystems@gmail.com
