#!/usr/bin/env bash


if [[ -z $1 ]]; then
    echo "Usage: $0 <PATHTORAWFILE>"
    exit 1
fi

FILE="$1"
NEWFILE="$1-sorted"
TMPFILE=/tmp/930948058
TMPFILE2=/tmp/930948059

cat $FILE | grep -Po '^\S*' > $TMPFILE
cat $TMPFILE | sed '/^3/d' > $TMPFILE2
cat $TMPFILE2 | awk 'length($0) == 34 {print $0} length($0) == 33 {print $0}'> $TMPFILE
# cat $TMPFILE | sed 's/^1//' > $TMPFILE2
cat $TMPFILE | LANG=C sort > $NEWFILE

rm $TMPFILE $TMPFILE2
