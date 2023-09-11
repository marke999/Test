#!/bin/bash


# Email file
email_file=/

# Read the email content from the standard input
email_content=$(cat "$email_file")


# Extract the command from the email (assuming it's the first line)
command=$(echo "$email_content" | head -n 1)


# Execute the command and capture the output
output=$(eval "$command")


# Send the output back to your Gmail account using Postfix
echo "$output" | mail -s "Command Output" mark.ramesessystems@gmail.com
