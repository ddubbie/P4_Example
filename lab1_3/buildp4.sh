#!/bin/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/l3mini.nffw -l beryllium -4 l3mini.p4 
