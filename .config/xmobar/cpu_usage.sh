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

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
CPU_INT=$(echo $CPU_USAGE | cut -d'.' -f1)

COLOR=$GREEN
if [ "$CPU_INT" -gt "80" ]; then
	COLOR=$RED
elif [ "$CPU_INT" -gt "60" ]; then
	COLOR=$YELLOW
else
	COLOR=$GREEN
fi

echo "<fc=$FG$BG><fn=0> 龍 </fn></fc><fc=$COLOR$BG> $CPU_USAGE % </fc>"
