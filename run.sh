# Linux-like /proc and /sys filesystems
mount -t linprocfs linprocfs /srv/jail/$JID/proc
mount -t linsysfs linsysfs /srv/jail/$JID/sys

# Ramdisk required for /run
mount -t tmpfs tmpfs /srv/jail/$JID/run

# A read-only /dev filesystem with restricted set of devices
mount -t devfs devfs /srv/jail/$JID/dev
# :XXX: ruleset 4 must be initialised as explained earlier in this Wiki page
devfs -m /srv/jail/$JID/dev rule -s 4 applyset
# Ensure the jail has some essential devices
for DEVICE in null random urandom zero
do if [ ! -e /srv/jail/$JID/dev/$DEVICE ]
    then
        echo "error: device '/dev/$DEVICE' MUST be available in the jail"
        exit 1
    fi
done
# Ensure the jail has only a limited set of devices
for DEVICE in mem kmem
do if [ -e /srv/jail/$JID/dev/$DEVICE ]
    then
        echo "error: device '/dev/$DEVICE' MUST NOT be available in the jail"
        exit 1
    fi
done

# Compatibility symlink from /dev/shm to /run/shm
ln -s /run/shm /srv/jail/$JID/dev/

# :XXX: this IP address *must* be assigned to o
mkdir -p /var/run/jail
jail -J /var/run/jail/$JID.jid -c jid=$JID \
  name=jail$JID \
  path=/srv/jail/$JID \
  host.hostname=$HOSTNAME \
  ip4.addr=$IP \
  command=/bin/sh -- -c "/etc/init.d/rc S && /etc/init.d/rc 2"

