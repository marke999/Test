#!/bin/bash

################# TO ADD COMMAND HOW TO INCORPORATE EMAIL BODY ##################

#date_now=$(date +'%Y-%b-%d')

#Prompt for email details
#username=$(whoami)
read -p "To: " recipient
read -p "Subject: " subject
read -p "CC: " cc
read -p "BCC: " bcc
read -p "Message: " message
attachment_folder="/home/lgucebu1/Tasks/Email/Attachments"

#List files in the attachment foler
echo "Available files in the folder: "
ls "$attachment_folder"

#Prompt for attachment file name
read -p "Attachment File Name: " attachment_name

#Construct the attachment file path
attachment_path="/home/lgucebu1/Tasks/Email/Attachments/$attachment_name"
#attachemnt_path="/home/lgucebu1/Backup/MySQL/$date_now.tar.gz"

#Construct the email ehaders and body
#headers="To: $recipient
#Subject: $subject
#CC: $cc
#BCC: $bcc

(printf "%s\n" \
     "To: $recipient" \
     "Subject: [APPLICATION ERROR & ATTACHMENT] $subject" \
     "CC: $cc" \
     "BCC: $bcc" \
     "Content-Type: application/zip" \
     "Content-Disposition: attachment; filename=$attachment_path" \
     "Content-Transfer-Encoding: base64" \
     "";
 base64 "$attachment_path") | sendmail "$recipient"
