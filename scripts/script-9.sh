#!/bin/bash

iptables -N e01

iptables -A INPUT -m recent --name e01 --update --seconds 600 --hitcount 20 -j DROP

iptables -A FORWARD -m recent --name e01 --update --seconds 600 --hitcount 20 -j DROP

iptables -A INPUT -m recent --name e01 --set -j ACCEPT

iptables -A FORWARD -m recent --name e01 --set -j ACCEPT