#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/lab3_3.nffw -p ./build/pif_design.json -c lab3_3_rule.p4cfg 

