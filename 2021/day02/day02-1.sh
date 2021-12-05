#!/usr/bin/env bash
# Allow input from stdin or file, 'cause what more could one want?
[[ -t 0 ]] && { [[ -f $1 ]] && input=$(<"$1") || { echo "error: no input"; exit 1; }; } || input=$(</dev/stdin)

# Cut, paste and calculate!
paste <(grep forward <<< "$input" | cut -d ' ' -f2) <(grep down <<< "$input" | cut -d ' ' -f2) <(grep up <<< "$input" | cut -d ' ' -f2) | awk '{f+=$1; d+=$2; u+=$3} END {printf "%d\n", f*(d-u);}'
