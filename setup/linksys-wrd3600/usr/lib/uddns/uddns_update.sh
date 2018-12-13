#!/bin/sh

# Script periodically updates ip address assigned to hostname in dynamic dns database

# Delay between updates is 5 minutes by default if not set
[ -z "$delay" ] && delay=$((60*5))

# Get config data
. /etc/config/uddns

# Main loop
while true; do

    # Get external ip address
    ip=`curl --silent http://ipecho.net/plain`

    # Construct url address
    url="http://$user:$password@dynupdate.no-ip.com/nic/update?hostname=$hostname&myip=$ip"

    # Update ddns ip
    response=`curl --silent "$url"`

    # Check if update is ok and log it
    if echo "$response" | grep -E 'good|nochg'; then
        echo >&2 "INFO: Updated ddns ip ok. Ip is '$ip' as hostname '$hostname'"
    else
        echo >&2 "ERROR: ddns ip update failed"
        echo >&2 "url: $url"
        echo >&2 "$response"
        echo >&2
    fi

    # Delay
    sleep "$delay"
done
