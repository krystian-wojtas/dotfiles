#!/bin/sh

# Script periodically updates ip address assigned to hostname in dynamic dns database

# Use default configuration file path if not set
[-z "$config"] && config=/etc/config/uddns

# Read configuration
. "$config"

# Check if nescessary configuration is provided
if \
    [ -z "$user" ] ||
    [ -z "$password" ] ||
    [ -z "$hostname" ] ||
    [ -z "$delay" ] ||
    [ -z "$url" ];
then
    echo >&2 "ERROR: configuration file '$config' is not filled correctly"
    exit 1
fi

# Main loop
while true; do

    # Get external ip address
    ip=`curl --silent http://ipecho.net/plain`

    # Replace shell variable names with its values in url string
    url_resolved=$(eval echo "$url")

    # Update ddns ip
    response=$(curl --silent "$url_resolved")

    # Check if update is ok and log it
    if echo "$response" | grep -E 'good|nochg'; then
        echo >&2 "INFO: Updated ddns ip ok. Ip is '$ip' as hostname '$hostname'"
    else
        echo >&2 "ERROR: ddns ip update failed"
        echo >&2 "url: $url"
        echo >&2 "$response"
        echo >&2
    fi

    # Delay between ip updates
    sleep "$delay"
done
