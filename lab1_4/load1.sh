#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/l4fwd.nffw -p ./build/pif_design.json -c l4fwd_rule1.p4cfg

