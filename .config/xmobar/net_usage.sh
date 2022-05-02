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

LOW=0
MEDIUM=30
HIGH=150

LOG_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/net_usage"

read PREV_RX PREV_TX < "$LOG_FILE"

CURRENT_RX=$(($( \
	ls -1 /sys/class/net/ \
	| grep -vP "lo" \
	| while read f; do echo "/sys/class/net/$f/statistics/rx_bytes"; done \
	| xargs cat \
	| paste -sd "+")))
CURRENT_TX=$(($( \
	ls -1 /sys/class/net/ \
	| grep -vP "lo" \
	| while read f; do echo "/sys/class/net/$f/statistics/tx_bytes"; done \
	| xargs cat \
	| paste -sd "+")))

if [ ! -f "$LOG_FILE" ]; then
	echo "$DELTA_RX $DELTA_TX" > "$LOG_FILE"
fi

DELTA_RX="$(((CURRENT_RX-PREV_RX)))"
DELTA_TX="$(((CURRENT_TX-PREV_TX)))"

DELTA_RX_KB="$((DELTA_RX/1024))"
DELTA_TX_KB="$((DELTA_TX/1024))"

RX_COLOR=$FG
TX_COLOR=$FG

if [ "$DELTA_RX_KB" -gt "$HIGH" ]; then
	RX_COLOR=$RED
elif [ "$DELTA_RX_KB" -gt "$MEDIUM" ]; then
	RX_COLOR=$YELLOW
elif [ "$DELTA_RX_KB" -gt "$LOW" ]; then
	RX_COLOR=$GREEN
fi

if [ "$DELTA_TX_KB" -gt "$HIGH" ]; then
	TX_COLOR=$RED
elif [ "$DELTA_TX_KB" -gt "$MEDIUM" ]; then
	TX_COLOR=$YELLOW
elif [ "$DELTA_TX_KB" -gt "$LOW" ]; then
	TX_COLOR=$GREEN
fi

RX_TEXT=$(printf "<fc=$RX_COLOR$BG>▼ %s KiB</fc>" "$DELTA_RX_KB")
TX_TEXT=$(printf "<fc=$TX_COLOR$BG>▲ %s KiB</fc>" "$DELTA_TX_KB")

IP_ADDR=$(ip a | grep -P "\d.*state UP.*" | cut -d ":" -f1 | xargs ip route get | head -n 1 | awk '{print $7}')

if [ ! -z "$IP_ADDR" ]; then
	IP_ADDR=" - $IP_ADDR"
fi

echo "$CURRENT_RX $CURRENT_TX" > "$LOG_FILE"
echo "<fc=$FG$BG><fn=5>  </fn></fc>$RX_TEXT<fc=$FG$BG> $TX_TEXT$IP_ADDR </fc>"
