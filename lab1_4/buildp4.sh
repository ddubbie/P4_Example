#!/bin/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/l4fwd.nffw -l beryllium -4 l4fwd.p4 --no-debug-info 
