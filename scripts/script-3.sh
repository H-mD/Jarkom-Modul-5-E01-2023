#!/bin/bash

iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --conlimit-mask 0 -j DROP