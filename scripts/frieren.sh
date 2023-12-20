#!/bin/bash

#A7
route add -net 10.37.0.128 netmask 255.255.255.128 gw 10.37.0.14
#A8
route add -net 10.37.0.16 netmask 255.255.255.252 gw 10.37.0.14
#A9
route add -net 10.37.0.20 netmask 255.255.255.252 gw 10.37.0.14
#A10
route add -net 10.37.2.0 netmask 255.255.254.0 gw 10.37.0.14

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends isc-dhcp-relay
service isc-dhcp-relay start

echo -e "
SERVERS=\"10.37.0.18\"
INTERFACES=\"eth0 eth1 eth2\"
OPTIONS=
" > /etc/default/isc-dhcp-relay

echo -e "
net.ipv4.ip_forward=1
" >> /etc/sysctl.conf

service isc-dhcp-relay restart