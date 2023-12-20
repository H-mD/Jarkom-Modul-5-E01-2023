#!/bin/bash

apt-get update
apt-get install bind9 netcat -y

mkdir /etc/bind/e01

echo -e "
zone \"sein.e01.com\" {
	type master;
	file \"/etc/bind/e01/sein.e01.com\";
};

zone \"stark.e01.com\" {
	type master;
	file \"/etc/bind/e01/stark.e01.com\";
};
" >> /etc/bind/named.conf.local

echo -e "
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     sein.e01.com. root.sein.e01.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      sein.e01.com.
@       IN      A       10.37.4.2
www     IN      CNAME       sein.e01.com.
" > /etc/bind/e01/sein.e01.com

echo -e "
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     stark.e01.com. root.stark.e01.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      stark.e01.com.
@       IN      A       10.37.0.10
www     IN      CNAME       stark.e01.com.
" > /etc/bind/e01/stark.e01.com

echo -e "
options {
        directory \"/var/cache/bind\";

        forwarders {
            192.168.122.1;
        };

        //dnssec-validation auto;
        allow-query{ any; };
        listen-on-v6 { any; };
};
" > /etc/bind/named.conf.options

service bind9 restart