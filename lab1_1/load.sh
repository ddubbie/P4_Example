#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/lab1_wire_app.nffw -p ./build/pif_design.json -c wire_app_rule.p4cfg

