#!/bin/sh
rm -rf build
rm Makefile-nfp4build
mkdir -p build
/opt/netronome/p4/bin/nfp4build -o ./build/lab3_3.nffw -l beryllium -4 lab3_3.p4 -c filter.c
