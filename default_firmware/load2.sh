#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/default.nffw -p ./build/pif_design.json -c default_rule2.p4cfg

