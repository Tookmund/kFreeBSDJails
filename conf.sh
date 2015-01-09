# Configuration parameters

# Location of scripts
LOC=/srv/jail/scripts

# Location of runscripts (can be the same place)
RLOC=/srv/jail/scripts

# Location of jail roots (each jail will get its own root directory under this
JAILS=/srv/jail

# Where to get debs from for debootstrap
MIRROR="http://http.debian.net/debian"

# Network interface for the jails to use
IF=xl0

# Domain name for jails to use
DN="local.tld"

# Names of all the scripts
SCRIPTS=(new.sh conf.sh jexec mkjail.sh rule4.sh run.sh)

installscripts () {
	install -m 700 -g root -o root -t $LOC $SCRIPTS
}
