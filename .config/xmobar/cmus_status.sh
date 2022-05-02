#!/usr/bin/bash

TRACK=$(cmus-remote -Q | grep file | awk -F'/' '{print $NF}')
TRUNKED_TRACK=$(echo $TRACK | sed 's/\(.\{1,30\}\).*/\1/')

if [ "$TRUNKED_TRACK" != "$TRACK" ]; then
	TRUNKED_TRACK="$TRUNKED_TRACK..."
fi

STATUS=$(cmus-remote -Q | grep status | awk '{print $2}')

# Play emojie
STATUS_ICON=""
if [ "$STATUS" = "playing" ]; then
	STATUS_ICON=""
elif [ "$STATUS" = "paused" ]; then
	STATUS_ICON=""
else
	exit 0
fi

echo "  $STATUS_ICON $TRUNKED_TRACK"
