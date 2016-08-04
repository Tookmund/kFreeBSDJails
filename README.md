Status: Complete

Debian Jails
============
A set of scripts to manage jails in Debian GNU/kFreeBSD

Mostly based on the Debian kFreeBSD/GNU wiki page about jails

https://wiki.debian.org/Debian_GNU/kFreeBSD/Jails

Install
=======
Edit conf.sh to your liking then run

    ./install.sh

Usage
=====
    rule4.sh
Add ruleset 4 to devfs (run before running any jails)

    newjail $NAME $IP
Create a new jail with $NAME and assigned $IP and runscript $NAME

    basejail $BASE $NAME $IP
Create a jail $NAME with ip $IP based on jail $BASE

    $RLOC/$NAME
Run jail $NAME

    deljail $NAME
Delete jail $NAME

    jail -r $NAME
Stop jail and kill all of its processes

