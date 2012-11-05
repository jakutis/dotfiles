IPTABLES="/usr/sbin/iptables"
if [ -z "$PUBIF" ]
then
    echo "PUBIF is not specified"
    exit 1
fi

echo 1 > /proc/sys/net/ipv4/ip_forward

"$IPTABLES" -t filter -F
"$IPTABLES" -t filter -X
"$IPTABLES" -t filter -P INPUT ACCEPT
"$IPTABLES" -t filter -P FORWARD ACCEPT
"$IPTABLES" -t filter -P OUTPUT ACCEPT

"$IPTABLES" -t nat -F
"$IPTABLES" -t nat -X
"$IPTABLES" -t nat -P POSTROUTING ACCEPT
"$IPTABLES" -t nat -P PREROUTING ACCEPT
"$IPTABLES" -t nat -P OUTPUT ACCEPT
"$IPTABLES" -t nat -A POSTROUTING -o "$PUBIF" -j MASQUERADE
