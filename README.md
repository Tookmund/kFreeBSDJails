Debian Jails
============
A set of scripts to manage jails in Debian GNU/kFreeBSD

Mostly based on the Debian kFreeBSD/GNU wiki page about jails

https://wiki.debian.org/Debian_GNU/kFreeBSD/Jails

Install
=======
Edit conf.sh to your liking then run
    ./install.sh
as root

Then place conf.jail where you see fit and change newjail and deljail to
reflect that

Usage
=====
    rule4.sh
Add ruleset 4 to devfs (run on boot before running any jails)

    newjail $NAME $IP
Create a new jail with $NAME and assigned $IP and runscript $NAME

	$RLOC/$NAME
Run jail $NAME

	jail -r $NAME
Stop jail and kill all of its processes

