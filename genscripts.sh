#!/bin/sh

genrun () {
	echo "Generating run script..."

	echo "#!/bin/sh" > /tmp/jail.$NAME
	echo "ifconfig $IF add $IP" >> /tmp/jail.$NAME
	echo "NAME=$NAME" >> /tmp/jail.$NAME
	echo "IP=$IP" >> /tmp/jail.$NAME
	echo "HOSTNAME=$HOSTNAME" >> /tmp/jail.$NAME

	cat $LOC/run.sh >> /tmp/jail.$NAME

	cat /tmp/jail.$NAME > $RLOC/run.$NAME.sh
	chmod +x $RLOC/run.$NAME.sh
}

