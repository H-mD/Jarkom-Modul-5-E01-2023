#!/bin/bash

iptables -A INPUT -p tcp --dport 22 -s 10.37.4.0/22 -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -j DROP
