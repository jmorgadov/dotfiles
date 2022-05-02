#!/usr/bin/bash

FG='#b7bcb9'
BG=""

if [ $# -gt 0 ] && [ $1 != "" ]; then
	FG=$1
fi
if [ $# -gt 1 ] && [ $2 != "" ]; then
	BG=",$2:0"
fi

DATE=$(date +"%a %d %b %R")
echo "<fc=$FG$BG> <fn=3></fn> $DATE </fc>"
