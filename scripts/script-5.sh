#!/bin/bash

iptables -A INPUT -p tcp --dport 80 -m time --days Mon,Tue,Wed,Thu,Fri --timestart 08:00 --timestop 16:00 -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j DROP