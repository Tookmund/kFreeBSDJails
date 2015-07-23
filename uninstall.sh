#!/bin/sh
. ./jail.config

SCRIPTS="genscripts.jail.sh mk.jail.sh rule4.sh run.sh newjail deljail"
for i in $SCRIPTS
do
	rm -f $LOC/$i
done

echo "You can now remove $JAILS $LOC and $RLOC if you wish"
