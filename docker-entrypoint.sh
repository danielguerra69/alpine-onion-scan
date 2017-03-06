#!/bin/sh
echo "starting Tor ..."
tor -f /etc/tor/torrc 1>/tmp/tor.stdout &
sleep 30
echo "starting Onionscan ..."
echo "$@"
echo "/root/bin/onionscan $@" > /root/scanonion.sh
chmod a+x /root/scanonion.sh
/root/scanonion.sh

exec "$@"
