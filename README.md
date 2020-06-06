A simple script to send IP and MAC addresses exracted from log files from a PI to FTP server.

`sudo -i`

`curl -H 'Cache-Control: no-cache' -sSL https://raw.githubusercontent.com/tretos53/pilog/master/pilog.sh | sudo bash $0 piname FTP_HOST username password`

```
Usage
$0 Filename pilog.sh
$1 piname, a name that will be added to a file
$2 FTP_HOST
$3 username FTP username and a local linux user
$4 password
```
