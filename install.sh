#!/bin/sh
# Install scripts to their install locations, as configured by conf.sh

. ./conf.jail
#check for root and if not exit
if [ ! `id -u` = 0 ]
then
	echo "Install must be done as root"
	exit 0
fi
# Install conf.jail
cp ./conf.jail $CONF

echo #!/bin/bash > newjail
echo -n '. ' >> newjail
echo $CONF >> newjail
cat newjail.sh >> newjail

echo #!/bin/bash > deljail
echo -n '. ' >> deljail
echo $CONF >> deljail
cat deljail.sh >> deljail

SCRIPTS="genscripts.jail.sh mk.jail.sh rule4.sh run.sh newjail deljail"
install -m 700 -g root -o root -t $LOC $SCRIPTS

# Create directories for runscripts and jails
mkdir -p $RLOC
mkdir -p $JAILS
chown root:root $RLOC $JAILS
chmod 700 $RLOC $JAILS
