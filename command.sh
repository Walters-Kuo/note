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

#sed
brew install gnu-sed
alias sed=gsed

#alias
alias ll='ls -alFh'
