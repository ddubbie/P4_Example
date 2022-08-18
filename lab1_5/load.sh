#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/lab1_5.nffw -p ./build/pif_design.json -c lab1_5_rule.p4cfg

