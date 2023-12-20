#!/bin/bash

apt-get update
apt-get install isc-dhcp-server netcat -y

echo -e "
INTERFACESv4=\"eth0\"
INTERFACESv6=\"\"
" > /etc/default/isc-dhcp-server

echo -e "
#A1
subnet 10.37.0.0 netmask 255.255.255.252 {
}

#A2
subnet 10.37.8.0 netmask 255.255.248.0 {
    range 10.37.8.2 10.37.15.254;
    option routers 10.37.8.1;
    option broadcast-address 10.37.15.255;
    option domain-name-servers 10.37.0.22;
    default-lease-time 300;
    max-lease-time 5760;
}

#A3
subnet 10.37.4.0 netmask 255.255.252.0 {
    range 10.37.4.2 10.37.7.254;
    option routers 10.37.4.1;
    option broadcast-address 10.37.7.255;
    option domain-name-servers 10.37.0.22;
    default-lease-time 300;
    max-lease-time 5760;
}

host Sein {
    hardware ethernet 56:08:50:c9:cd:0e;
    fixed-address 10.37.4.2;
}

#A4
subnet 10.37.0.4 netmask 255.255.255.252 {
}

#A5
subnet 10.37.0.8 netmask 255.255.255.252 {
    range 10.37.0.10 10.37.0.10;
    option routers 10.37.0.9;
    option broadcast-address 10.37.0.11;
    option domain-name-servers 10.37.0.22;
    default-lease-time 300;
    max-lease-time 5760;
}

host Stark {
    hardware ethernet da:99:8b:0f:1c:54;
    fixed-address 10.37.0.10;
}

#A6
subnet 10.37.0.12 netmask 255.255.255.252 {
}

#A7
subnet 10.37.0.128 netmask 255.255.255.128 {
    range 10.37.0.130 10.37.0.254;
    option routers 10.37.0.129;
    option broadcast-address 10.37.0.255;
    option domain-name-servers 10.37.0.22;
    default-lease-time 300;
    max-lease-time 5760;
}

#A8
subnet 10.37.0.16 netmask 255.255.255.252 {
}

#A9
subnet 10.37.0.20 netmask 255.255.255.252 {
    range 10.37.0.22 10.37.0.22;
    option routers 10.37.0.21;
    option broadcast-address 10.37.0.23;
    option domain-name-servers 192.168.122.1;
    default-lease-time 300;
    max-lease-time 5760;
}

host Richter {
    hardware ethernet e6:f7:42:33:c8:7b;
    fixed-address 10.37.0.22;
}

#A10
subnet 10.37.2.0 netmask 255.255.254.0 {
    range 10.37.2.2 10.37.3.254;
    option routers 10.37.2.1;
    option broadcast-address 10.37.3.255;
    option domain-name-servers 10.37.0.22;
    default-lease-time 300;
    max-lease-time 5760;
}
" >> /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart