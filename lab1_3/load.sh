#!/BIN/bash
/opt/netronome/p4/bin/rtecli  -p 20206 design-load -f ./build/l3mini.nffw -p ./build/pif_design.json -c  l3mini_rule.p4cfg

