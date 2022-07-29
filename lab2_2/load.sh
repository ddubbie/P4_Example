#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/lab2_2_tunnel.nffw -p ./build/pif_design.json -c lab2_2_tunnel_rule.p4cfg 

