#!/bin/sh
# ./new.sh $NAME $IP

# Where configuration script is stored
CONF=/srv/jail/scripts/conf.sh
source $CONF
NAME=$1
IP=$2
HOSTNAME=$NAME.$DN

if [ -e /srv/jail/$NAME ]
then
	echo "WARNING: Jail $NAME already exists!"
	echo "Overwrite? [y/n]"
	read RESP
	if [ $RESP = n ]
	then
		echo "Not overwriting $NAME"
		exit 0
	fi
	if [ $RESP = y ]
	then
		echo "Overwriting $NAME"
	else
		echo "Invalid. Not overwriting $NAME"
		exit 0
	fi
fi
source $LOC/mkjail.sh
mkjail

source $LOC/genscripts.sh
genrun

echo "Done!"

