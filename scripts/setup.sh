#!/usr/bin/env bash

TOPDIR=$(git rev-parse --show-toplevel)
cd $TOPDIR

rm -rf resources/
mkdir -p resources/
cd resources/
wget https://github.com/open-simh/simh/zipball/master

unzip master
rm -rf master

mv open-simh-simh-*/I650 .
mv open-simh-simh-*/sim* .
mv open-simh-simh-*/scp* .
mv open-simh-simh-*/makefile .

rm -rf open-simh-simh-*

# fix naming error in original repo
mv I650/sw/Build_soap_from_source.ini I650/sw/build_soap_from_source.ini
mv I650/sw/Build_is_from_decks.ini I650/sw/build_is_from_decks.ini

make i650

echo "Setup complete. Execute run.sh to run built-in examples."
echo " "
echo "Visit https://opensimh.org/simdocs/i650_doc for info."
echo "SimH IBM 650 files are in the resources/ dir"

