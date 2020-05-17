#!/usr/bin/env bash


BTC_DIR=$HOME/btc/BTC-CRACK-RESULT
BTC_RESULT=$BTC_DIR/BTC_FIND_ADDRESS
TELEGR=$HOME/git/settings/scripts/telebots/notification/notify-telegram-bot.py

while :; do
    inotifywait -e modify -e create -r --format "%e %w%f" $BTC_DIR |
    while read event fullpath; do
        if [[ -f $fullpath ]]; then
            DATA=$(cat $fullpath)
            $TELEGR "BTC FIND:\n$DATA"
        fi
    done
done
