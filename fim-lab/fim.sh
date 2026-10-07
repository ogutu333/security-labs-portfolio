#!/bin/bash

BASELINE="baseline.txt"
CURRENT="current.txt"

echo "======================================"
echo " File Integrity Monitoring"
echo "====================================="
echo

find webroot -type f -exec sha256sum {} \; | sort > "$CURRENT"

echo "[*] Comparing current state with baseline..."
echo

if diff -u <(sort "$BASELINE") "$CURRENT" > changes.txt; then
	echo "[OK] No file integrity violations detected."
else
	TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

	echo "[$TIMESTAMP] ALERT: File integrity changes detected!" >> fim.log
	cat changes.txt >> fim.log

	echo "[ALERT] File integrity changes detected!"
	cat changes.txt
fi
