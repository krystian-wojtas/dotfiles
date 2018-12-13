#!/bin/sh

# Get config data
. /etc/config/uddns

# Main loop
while true; do

    # Get external ip address
    ip=`curl --silent http://ipecho.net/plain`

    # Update ddns ip
    curl --silent "http://$user:$password@dynupdate.no-ip.com/nic/update?hostname=$hostname&myip=$ip" |
    grep -E 'good|nochg' &&
    echo >&2 "Updated ddns ip '$ip' as hostname '$hostname'" ||
    echo >&2 "ERROR: ddns ip update failed"

    # Delay 5 minutes
    sleep $((60*5))
done
