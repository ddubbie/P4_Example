#!/bin/sh
mkdir -p build
rm -rf build
rm Makefile-nfp4build
/opt/netronome/p4/bin/nfp4build -o ./build/lab1_wire_app.nffw -l beryllium -4 lab1_wire_app.p4 
