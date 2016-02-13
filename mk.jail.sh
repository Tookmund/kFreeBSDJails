# Generate basic jail folder
mkjail () {
	debootstrap \
	 --exclude=devd,dmidecode,isc-dhcp-client,isc-dhcp-common,kldutils,pf,vidcontrol \
	 wheezy /${JAILS}/${NAME} "{$MIRROR}"

	echo "${HOSTNAME}" > /${JAILS}/${NAME}/etc/hostname
	echo "${IP} ${HOSTNAME}" >> /${JAILS}/${NAME}/etc/hosts
}
