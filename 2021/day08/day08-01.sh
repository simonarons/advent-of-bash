#!/usr/bin/env bash

# Input from wherever.
[[ -t 0 ]] && { [[ -f $1 ]] && input=$(<"$1") || { echo "error: no input"; exit 1; }; } || input=$(</dev/stdin)

(cut -d '|' -f2  | tr ' ' '\n' | awk '{print length}' | grep '^[2347]$' | wc -l) <<< "$input"
