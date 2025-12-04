#!/usr/bin/env bash

TOPDIR=$(git rev-parse --show-toplevel)
cd $TOPDIR

BIN=$TOPDIR/resources/BIN/i650

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <example-name>"
  echo " "
  echo "Example list:"
  echo "    - machine-code: add two numbers via raw IBM 650 machine instructions"
  echo "    - soap: run SOAP-II program on the emulator calculating 2x^2 + 3x + 4 for 1<=x<=100"
  echo "    - for-transit-1: run simple FOR TRANSIT program printing prime numbers"
  echo "    - for-transit-2: run simple FOR TRANSIT program implementing bubblesort"
  echo "    - for-transit-3: run simple FOR TRANSIT program drawing graphics on a punch card"
  echo "    - demo-all: run all the default simh demos"
  echo " "
  echo "A wide terminal window is recommended for proper output."
  exit 1
fi

if [ ! -f "$BIN" ]; then
    echo "$BIN does not exist! Run setup.sh first."
    exit 1
fi

cd resources/I650/sw

if [ "$1" = "machine-code" ]; then
  exec $BIN $TOPDIR/custom/test_machine_code.ini
fi

if [ "$1" = "soap" ]; then
  exec $BIN run_soap.ini soap/soap_example_1_src.txt 1000
fi

if [ "$1" = "for-transit-1" ]; then
  exec $BIN run_fortransit.ini fortransit/fortransit_example_1_src.txt
fi

if [ "$1" = "for-transit-2" ]; then
  exec $BIN run_fortransit.ini $TOPDIR/custom/fortransit_example_sort_with_data.txt $TOPDIR/custom/fortransit_example_sort_data_1.txt
fi

if [ "$1" = "for-transit-3" ]; then
  exec $BIN run_fortransit.ini fortransit/fortransit_example_5_src.txt
fi

if [ "$1" = "demo-all" ]; then
  cd ..
  exec $BIN 650_demo_all.ini
fi
