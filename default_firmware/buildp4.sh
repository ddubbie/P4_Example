#!/bin/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/default.nffw -l beryllium -4 main.p4 --no-debug-info 
