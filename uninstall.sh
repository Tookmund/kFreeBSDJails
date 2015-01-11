#!/bin/sh
. ./conf.jail

# Check for root and if not exit
if [ ! `id -u` = 0 ]
then
	echo "Uninstall must be done as root"
	exit 0
fi

SCRIPTS=(genscripts.jail.sh mk.jail.sh rule4.sh run.sh)
for i in $SCRIPTS
do
	rm -f $LOC/$i
done

echo "You can now remove $JAILS $LOC and $RLOC if you wish"
