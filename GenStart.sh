#!/usr/bin/env bash


RAND=$(xxd -p -c 32 -l 32 /dev/urandom)

BTC_LIST=/home/elpadre/btc/blockchair_bitcoin_addresses_latest_15_05_2020.tsv-sorted
BTC_RESULT=/home/elpadre/_BTC_FIND_

./bin/cuBitCrack -i $BTC_LIST \
                 -o $BTC_RESULT -d 0 \
                 -b 32 -t 64 -p 32 \
                 --keyspace $RAND:+2540BE400
