# newjail $NAME $IP

NAME=${1}
IP=${2}
HOSTNAME=${NAME}.${DN}

checkjail

. ${LOC}/mk.jail.sh
mkjail

. ${LOC}/genscripts.jail.sh
genrun

echo "Done!"

