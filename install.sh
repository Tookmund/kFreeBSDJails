#!/bin/sh
# Install scripts to their install locations, as configured by conf.sh

. ./conf.jail

# Install conf.jail
cp ./conf.jail $CONF

setupscript () {
	echo #!/bin/bash > $1
	echo -n '. ' >> $1
	echo $CONF >> $1
	cat $1.sh >> $1
}

setupscript newjail
setupscript deljail
setupscript basejail
SCRIPTS="genscripts.jail.sh mk.jail.sh rule4.sh run.sh newjail deljail"
install -m 700 -g root -o root -t $LOC $SCRIPTS

# Create directories for runscripts and jails
mkdir -p $RLOC
mkdir -p $JAILS
chown root:root $RLOC $JAILS
chmod 700 $RLOC $JAILS
