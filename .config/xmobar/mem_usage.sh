#!/usr/bin/bash

FG='#b7bcb9'
BG=""
GREEN='#00FF00'
YELLOW='#FFFF00'
RED='#FF0000'

if [ $# -gt 0 ] && [ $1 != "" ]; then
	FG=$1
fi
if [ $# -gt 1 ] && [ $2 != "" ]; then
	BG=",$2:0"
fi
if [ $# -gt 2 ] && [ $3 != "" ]; then
	GREEN=$3
fi
if [ $# -gt 3 ] && [ $4 != "" ]; then
	YELLOW=$4
fi
if [ $# -gt 4 ] && [ $5 != "" ]; then
	RED=$5
fi

PERCENT=$(free | grep Mem: | awk '{print ($3*100)/$2}')
F_PERCENT=$(printf "%.1f" $PERCENT)
I_PERCENT=$(printf "%.0f" $PERCENT)

COLOR=$GREEN
if [ "$I_PERCENT" -gt "80" ]; then
	COLOR=$RED
elif [ "$I_PERCENT" -gt "60" ]; then
	COLOR=$YELLOW
else
	COLOR=$GREEN
fi

echo "<fc=$FG$BG><fn=0>  </fn></fc><fc=$COLOR$BG> $F_PERCENT % </fc>"
