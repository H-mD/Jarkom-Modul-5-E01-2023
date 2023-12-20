#!/bin/bash

iptables -I INPUT 1 -j LOG --log-prefix "DROP: "