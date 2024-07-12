monitor
asitop : performance monitoring CLI tool for Apple Silicon


#bash
cut -d: -f1 /etc/passwd

find all .php contain "http://money.udn.com"
grep -rl "http://money.udn.com" . --include=\*.php
grep -rin "money.udn.com" ./ //i 無大小寫且 n 顯示行數

killall -9 tcp_daemon.php

difft
difft sample_files/before.js sample_files/after.js #Diffing Files
difft sample_files/dir_before/ sample_files/dir_after/ #diffing directories
cat sample_files/before.js | difft - sample_files/after.js #You can read a file from stdin by specifying - as the file path.
#list all service
systemctl list-units --type=service
systemctl list-units --type=service --state=running #only running

php syntax detecte
php -i | grep "Loaded Configuration File" #php.ini
php -r 'echo date("Ymd", strtotime("-1 day"));'
find ./ -name \*.php -not -path "./vendor/*"   \! -exec php -l {} \; >> ../syntax-result

du -sh ./ #determine the size of a directory, -s summary, -h human readable
du -sh ./* #list all files and directories in the current directory

scp source_username@source_host:source_file [dest_userid@dest_host:]destination_dir
scp source_username@source_host:source_file destination_dir

rm -rf file #remove the file without prompting you for confirmation

cd - #change the current directory to the previous working directory
cd ~ #return to user's home directory

!! on command line will be replaced by last command issued:
mv /etc/hostname /etc/hostname.old
mv: rename /etc/hostname to /etc/hostname.old: Operation not permitted
sudo !! #sudo mv /etc/hostname /etc/hostname.old

!$ on command line will be replaced by last command arguments:
mkdir /tmp/test
cd !$ #cd /tmp/test

sudo user vs su user or sudo su vs su -
sudo su - centos
su requires the password of the target account, while sudo requires the password of the current user.

#hardware
cat /proc/cpuinfo | grep 'processor' | wc -l

#hotkey
ctr + L to clear the screen


#ssh
ssh-keygen -t rsa
ssh-keygen -t rsa -b 4096 -C "your@email.com" -f name_rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2200 vagrant@127.0.0.1
cat name_rsa.pub | pbcopy #copy public key to the clipboard

#.ssh/config
Host xxx
Hostname 10.0.0.1
Port 22
User git
IdentityFile ~/.ssh/gitlab
IdentitiesOnly yes

#sed
brew install gnu-sed
alias sed=gsed

#env
alias ll='ls -alFh'


tar -xvf

#brew
brew info python

#network
lsof -nP -iTCP -sTCP:LISTEN
lsof -n -i | grep LISTEN
netstat -tunlp
netstat -rn
        Format/result           |       Command              |          Output
--------------------------------+----------------------------+------------------------------
YYYY-MM-DD                      | date -I                    | $(date -I)
YYYY-MM-DD_hh:mm:ss             | date +%F_%T                | $(date +%F_%T)
YYYYMMDD_hhmmss                 | date +%Y%m%d_%H%M%S        | $(date +%Y%m%d_%H%M%S)
YYYYMMDD_hhmmss (UTC version)   | date --utc +%Y%m%d_%H%M%SZ | $(date --utc +%Y%m%d_%H%M%SZ)
YYYYMMDD_hhmmss (with local TZ) | date +%Y%m%d_%H%M%S%Z      | $(date +%Y%m%d_%H%M%S%Z)
YYYYMMSShhmmss                  | date +%Y%m%d%H%M%S         | $(date +%Y%m%d%H%M%S)
YYYYMMSShhmmssnnnnnnnnn         | date +%Y%m%d%H%M%S%N       | $(date +%Y%m%d%H%M%S%N)
YYMMDD_hhmmss                   | date +%y%m%d_%H%M%S        | $(date +%y%m%d_%H%M%S)
Seconds since UNIX epoch:       | date +%s                   | $(date +%s)
Nanoseconds only:               | date +%N                   | $(date +%N)
Nanoseconds since UNIX epoch:   | date +%s%N                 | $(date +%s%N)
ISO8601 UTC timestamp           | date --utc +%FT%TZ         | $(date --utc +%FT%TZ)
ISO8601 UTC timestamp + ms      | date --utc +%FT%T.%3NZ     | $(date --utc +%FT%T.%3NZ)
ISO8601 Local TZ timestamp      | date +%FT%T%Z              | $(date +%FT%T%Z)
YYYY-MM-DD (Short day)          | date +%F\(%a\)             | $(date +%F\(%a\))
YYYY-MM-DD (Long day)           | date +%F\(%A\)             | $(date +%F\(%A\))

Number 	Permission Type         Symbol
0 	No Permission 	        —
1 	Execute         	-x
2 	Write 	                -w-
3 	Execute,Write           -wx
4 	Read                    r-
5 	Read,Execute 	        r-x
6 	Read,Write 	        rw-
7 	Read,Write,Execute 	rwx

#time
timedatectl list-timezones | grep Taipei
sudo timedatectl set-timezone Asia/Taipei


find . -name 'Queen*' //find file name Queenxxxxx

#which shell am i using
echo $SHELL
ps -p $$

#crontab servcie
service cron stop|start|restart|status
