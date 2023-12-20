#!/bin/bash

ip=$(ip a | grep eth0 | grep inet | cut -d "/" -f 1 | cut -d "t" -f 2)

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $ip