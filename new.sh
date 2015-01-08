#!/bin/sh
# ./new.sh $JID $IP

# Network interface for the Jail to use
IF=xl0
# Domain name
DN="local.tld"

JID=$1
MIRROR="http://http.debian.net/debian"
IP=$2
HOSTNAME=jail$JID.$DN

debootstrap \
 --exclude=devd,dmidecode,isc-dhcp-client,isc-dhcp-common,kldutils,pf,vidcontrol \
 wheezy /srv/jail/$JID "$MIRROR"

echo "$HOSTNAME" > /srv/jail/$JID/etc/hostname
echo "$IP $HOSTNAME" >> /srv/jail/$JID/etc/hosts

#Generate run script
echo "#!/bin/sh" > /tmp/$JID
echo "ifconfig $IF add $IP" >> /tmp/$JID
echo "JID=$JID" >> /tmp/$JID
echo "IP=$IP" >> /tmp/$JID
echo "HOSTNAME=$HOSTNAME" >> /tmp/$JID

cat run.sh >> /tmp/$JID

cat /tmp/$JID > run.$JID.sh
chmod +x run.$JID.sh
