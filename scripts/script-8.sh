#!/bin/bash

iptables -I INPUT 1 -m time --datestart "2024-02-14T00:00" --datestop "2024-03-20T23:59" -j DROP