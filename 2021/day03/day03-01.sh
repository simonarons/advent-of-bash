#!/usr/bin/env bash
# Allow input from stdin or file, 'cause what more could one want?
[[ -t 0 ]] && { [[ -f $1 ]] && input=$(<"$1") || { echo "error: no input"; exit 1; }; } || input=$(</dev/stdin)

len=$(wc -l <<< "$input")
for i in {1..12}; do (( $(cut -b${i} <<< "$input" | grep -c 0) > len/2 )) && g=${g}0 e=${e}1 || g=${g}1 e=${e}0; done
echo $(( 2#$g * 2#$e ))
