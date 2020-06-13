#!/bin/bash

:<<"USAGE"
$0 Filename pilog.sh
$1 piname, a name that will be added to a file
$2 FTP HOST
$3 username FTP username and a local linux user
$4 password Password for FTP
USAGE

# Check number of parameters provided by user
if (( $# != 4 )) 
    then 
        echo "" 
        echo "┌─────────────────────────────────────────" 
        echo "│EXAMPLE: bash pilog.sh piname FTP_HOST username password" 
        echo "└─────────────────────────────────────────" 
        echo "" 
    exit 1
fi

date=$(date +%F_%H-%M-%S)
find /var/log/ -name '*.gz' -execdir gunzip '{}' \;
# sudo grep -hoiIs -E '([0-9]{1,3}[\.]){3}[0-9]{1,3}' /var/log/nginx/* | sort -u >> /home/$3/$1_${date}_connections.txt
sudo grep -hoiIs '[0-9A-F]\{2\}\(:[0-9A-F]\{2\}\)\{5\}' /var/log/* | sort -u >> /home/$3/$1_${date}_connections.txt
curl -T /home/$3/$1_${date}_connections.txt --user $3:$4 ftp://$2
