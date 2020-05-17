#!/usr/bin/env bash


BTC_RESULT=/home/elpadre/btc/BTC-CRACK-RESULT
TELEGR=$HOME/git/settings/scripts/telebots/notification/notify-telegram-bot.py

while :; do
    inotifywait -e modify -e create -r --format "%e %w%f" $BTC_RESULT |
    while read event fullpath; do
        if [[ -f $fullpath ]]; then
            DATA=$(cat $fullpath)
            $TELEGR "BTC FIND:\n$DATA"
        fi
    done
done
