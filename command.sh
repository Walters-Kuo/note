#bash

cd - #change the current directory to the previous working directory
cd ~ #return to user's home directory

!! on command line will be replaced by last command issued:
mv /etc/hostname /etc/hostname.old
mv: rename /etc/hostname to /etc/hostname.old: Operation not permitted
sudo !! #sudo mv /etc/hostname /etc/hostname.old

!$ on command line will be replaced by last command arguments:
mkdir /tmp/test
cd !$ #cd /tmp/test

#hotkey
ctr + L to clear the screen


#ssh
ssh-keygen -t rsa
ssh-keygen -t rsa -b 2048 -C v20-gitlab

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


#brew
brew info python

#network
lsof -nP -iTCP -sTCP:LISTEN
lsof -n -i | grep LISTEN