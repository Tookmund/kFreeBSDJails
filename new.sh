#!/bin/sh
# ./new.sh $NAME $IP

# Network interface for the Jail to use
IF=xl0
# Domain name
DN="local.tld"

NAME=$1
MIRROR="http://http.debian.net/debian"
IP=$2
HOSTNAME=$NAME.$DN

if [ $NAME = $(basename $(dirname `pwd`)) ]
then
	echo "jail cannot have the same name as script folder: $NAME"
	exit 0
fi

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
debootstrap \
 --exclude=devd,dmidecode,isc-dhcp-client,isc-dhcp-common,kldutils,pf,vidcontrol \
 wheezy /srv/jail/$NAME "$MIRROR"

echo "$HOSTNAME" > /srv/jail/$NAME/etc/hostname
echo "$IP $HOSTNAME" >> /srv/jail/$NAME/etc/hosts

echo "Generating run script..."

echo "#!/bin/sh" > /tmp/jail.$NAME
echo "ifconfig $IF add $IP" >> /tmp/jail.$NAME
echo "NAME=$NAME" >> /tmp/jail.$NAME
echo "IP=$IP" >> /tmp/jail.$NAME
echo "HOSTNAME=$HOSTNAME" >> /tmp/jail.$NAME

cat run.sh >> /tmp/jail.$NAME

cat /tmp/jail.$NAME > run.$NAME.sh
chmod +x run.$NAME.sh

echo "Done!"
