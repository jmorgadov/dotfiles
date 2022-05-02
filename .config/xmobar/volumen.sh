#!/usr/bin/bash

FG='#b7bcb9'
BG=""

if [ $# -gt 0 ] && [ $1 != "" ]; then
	FG=$1
fi
if [ $# -gt 1 ] && [ $2 != "" ]; then
	BG=",$2:0"
fi

VOL=$(amixer get Master | tail -n 1 | awk '{print $5}' | grep -oP "\d*")

echo "<fc=$FG$BG><fn=3> 墳</fn></fc><fc=$FG$BG> $VOL % </fc>"
