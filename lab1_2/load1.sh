#!/bin/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/lab1_packet_wire.nffw -p ./build/pif_design.json -c lab1_packet_wire_rule1.p4cfg 

