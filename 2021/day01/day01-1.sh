#!/usr/bin/env bash
# Allow input from stdin or file, 'cause what more could one want?
[[ -t 0 ]] && { [[ -f $1 ]] && mapfile -t input < "$1" || { echo "error: no input"; exit 1; }; } || input=( $(</dev/stdin) )

# Then just work that bash magic.
while ((i<${#input[@]}-1)); do ((input[i]<input[++i])) && ((sum++)); done; echo $sum
