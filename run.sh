# Linux-like /proc and /sys filesystems
mount -t linprocfs linprocfs /${JAILS}/${NAME}/proc
mount -t linsysfs linsysfs /${JAILS}/${NAME}/sys

# Ramdisk required for /run
mount -t tmpfs tmpfs /${JAILS}/${NAME}/run

# A read-only /dev filesystem with restricted set of devices
mount -t devfs devfs /${JAILS}/${NAME}/dev
# :XXX: ruleset 4 must be initialised
devfs -m /${JAILS}/${NAME}/dev rule -s 4 applyset
# Ensure the jail has some essential devices
for DEVICE in null random urandom zero
do if [ ! -e /${JAILS}/${NAME}/dev/${DEVICE} ]
    then
        echo "error: device '/dev/${DEVICE}' MUST be available in the jail"
        exit 1
    fi
done
# Ensure the jail has only a limited set of devices
for DEVICE in mem kmem
do if [ -e /${JAILS}/${NAME}/dev/${DEVICE} ]
    then
        echo "error: device '/dev/${DEVICE}' MUST NOT be available in the jail"
        exit 1
    fi
done

# Compatibility symlink from /dev/shm to /run/shm
ln -s /run/shm /${JAILS}/${NAME}/dev/

mkdir -p /var/run/jail
jail -J /var/run/jail/${NAME}.jid -c \
  name=${NAME} \
  path=/${JAILS}/${NAME} \
  host.hostname=${HOSTNAME} \
  ip4.addr=${IP} \
  command=/bin/sh -- -c "/etc/init.d/rc S && /etc/init.d/rc 2"

