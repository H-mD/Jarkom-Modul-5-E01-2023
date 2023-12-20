#!/bin/bash

iptables -A PREROUTING -t nat -p tcp --dport 80 -d 10.37.4.2 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.37.4.2

iptables -A PREROUTING -t nat -p tcp --dport 80 -d 10.37.4.2 -j DNAT --to-destination 10.37.0.10

iptables -A PREROUTING -t nat -p tcp --dport 443 -d 10.37.0.10 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.37.0.10

iptables -A PREROUTING -t nat -p tcp --dport 443 -d 10.37.0.10 -j DNAT --to-destination 10.37.4.2