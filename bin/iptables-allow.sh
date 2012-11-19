#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]
then
  sudo $0 "$@"
  exit
fi

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -F
iptables -X
iptables -P FORWARD ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT

