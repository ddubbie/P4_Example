#!/bin/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/lab2_tunnel.nffw -l beryllium -4 lab2_tunnel.p4 
