#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/lab3_4.nffw -p ./build/pif_design.json -c lab3_4_rule.p4cfg 

