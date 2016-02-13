# Delete a jail and its runscript
# deljail ${NAME}

NAME=${1}

echo "Killing Jail ${NAME}"
jail -r name=${NAME} || echo "Jail ${NAME} is not started or failed to stop: $?"

if [ ! -e /${JAILS}/${NAME} ]
then
	echo "Jail ${NAME} does not exist. Not deleting it."
else
	echo "Removing Jail ${NAME}"
	rm -rfv /${JAILS}/${NAME} || echo "Deleting Jail ${NAME} failed: $?"
fi

if [ ! -e /${RLOC}/${NAME} ]
then
	echo "Runscript for Jail ${NAME} does not exist. Not deleting it."
else
	echo "Removing runscript for Jail ${NAME}"
	rm /${RLOC}/${NAME}.jail
fi
