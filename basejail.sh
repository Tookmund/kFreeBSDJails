# basejail $BASE $NAME $IP
BASE=$1
NAME=$2
IP=$3
HOSTNAME=$NAME.$DN

if [ -e $JAILS/$NAME ]
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

cp -rvf $JAILS/$BASE $JAILS/$NAME

. $LOC/genscripts.jail.sh
genrun

echo "Done!"

