#!/bin/bash

iptables -I INPUT 1 -p tcp --dport 80 -m time --days Mon,Tue,Wed,Thu --timestart 12:00 --timestop 13:00 -j DROP

iptables -I INPUT 2 -p tcp --dport 80 -m time --days Fri --timestart 11:00 --timestop 13:00 -j DROP