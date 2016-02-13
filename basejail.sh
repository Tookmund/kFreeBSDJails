# basejail $BASE ${NAME} $IP
BASE=${1}
NAME=${2}
IP=${3}
HOSTNAME=${NAME}.${DN}

checkjail

cp -rvf /${JAILS}/$BASE ${JAILS}/${NAME}

. ${LOC}/genscripts.jail.sh
genrun

echo "Done!"

