#!/BIN/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/lab1_packet_wire.nffw -l beryllium -4 lab1_packet_wire.p4 
