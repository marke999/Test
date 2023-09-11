#!/bin/bash

#Prompt for email details
username=$(whoami)
read -p "To: " recipient
read -p "Subject: " subject
read -p "CC: " cc
read -p "BCC: " bcc
read -p "Message: " message

#Construct the email headers and body
headers="To: $recipient
Subject: $subject
CC: $cc
BCC: $bcc

$message"

#Send email using the sendmail commmand
echo "$headers" | /usr/sbin/sendmail -t
