#!/bin/sh
ipv6addr=$(ip -6 address show dev eth0 | grep inet6 | grep -v fe80 | head -n 1 | awk '{print $2}' | awk -F'/' '{print $1}')
echo "Updating DuckDNS with IPv6 address: $ipv6addr"
curl -s "https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ipv6=$ipv6addr" -o ~/duckdns/duckdns.log
