#!/bin/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/lab1_5.nffw -l beryllium -4 lab1_5.p4 --no-debug-info 
