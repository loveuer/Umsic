#!/bin/bash
# Get network traffic stats for an app by package name
# Uses TrafficStats API via dumpsys

PACKAGE="${1:-com.umsic.music}"
DEVICE="${2}"

# Get UID from package
UID=$(adb $DEVICE shell "dumpsys package $PACKAGE" | grep -oP 'uid=\K\d+' | head -1)

if [ -z "$UID" ]; then
  echo "Package $PACKAGE not found or UID not available"
  exit 1
fi

echo "Package: $PACKAGE"
echo "UID: $UID"
echo ""

# Try qtaguid stats (works on rooted devices)
if adb $DEVICE shell "su -c 'cat /proc/net/xt_qtaguid/stats'" 2>/dev/null | grep -q "$UID"; then
  adb $DEVICE shell "su -c 'cat /proc/net/xt_qtaguid/stats'" 2>/dev/null | awk -v uid="$UID" '{
    if($4==uid) { rx+=$5; tx+=$6 }
  } END {
    printf "Sent: %.2f MB\nRecv: %.2f MB\nTotal: %.2f MB\n", tx/1048576, rx/1048576, (tx+rx)/1048576
  }'
else
  # Fallback: try to get from dumpsys networkstats
  adb $DEVICE shell "dumpsys netstats detail" | grep -B5 -A10 "$UID"
fi
