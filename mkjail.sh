#!/bin/sh
# mkjail.sh $NAME
# Generate basic jail folder

MIRROR="http://http.debian.net/debian"
debootstrap \
 --exclude=devd,dmidecode,isc-dhcp-client,isc-dhcp-common,kldutils,pf,vidcontrol \
 wheezy /srv/jail/$1 "$MIRROR"

echo "$HOSTNAME" > /srv/jail/$1/etc/hostname
echo "$IP $HOSTNAME" >> /srv/jail/$1/etc/hosts
