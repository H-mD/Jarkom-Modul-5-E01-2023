#!/bin/bash

#A2
route add -net 10.37.8.0 netmask 255.255.248.0 gw 10.37.0.2
#A3
route add -net 10.37.4.0 netmask 255.255.252.0 gw 10.37.0.2
#A5
route add -net 10.37.0.8 netmask 255.255.255.252 gw 10.37.0.6
#A6
route add -net 10.37.0.12 netmask 255.255.255.252 gw 10.37.0.6
#A7
route add -net 10.37.0.128 netmask 255.255.255.128 gw 10.37.0.6
#A8
route add -net 10.37.0.16 netmask 255.255.255.252 gw 10.37.0.6
#A9
route add -net 10.37.0.20 netmask 255.255.255.252 gw 10.37.0.6
#A10
route add -net 10.37.2.0 netmask 255.255.254.0 gw 10.37.0.6

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends isc-dhcp-relay
service isc-dhcp-relay start

echo -e "
SERVERS=\"10.37.0.18\"
INTERFACES=\"eth1 eth2\"
OPTIONS=
" > /etc/default/isc-dhcp-relay

echo -e "
net.ipv4.ip_forward=1
" >> /etc/sysctl.conf

service isc-dhcp-relay restart