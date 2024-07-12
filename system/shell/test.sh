#!/bin/bash 
Date=`date +%Y%m%d%H%M%S`
TARGET_VERSION="release"

case $1 in 
'app')
# app update
	#cd /local/container/app/member
	#git pull -u origin master
	if [ -n "$2" ]
        then
            TARGET_VERSION="$2"
	fi
    echo "target_version is "$TARGET_VERSION
;;
'app_front')
# app_front update
	echo "front"
;;
esac

exit 0