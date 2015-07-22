# newjail $NAME $IP

NAME=$1
IP=$2
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
. $LOC/mk.jail.sh
mkjail

. $LOC/genscripts.jail.sh
genrun

echo "Done!"

