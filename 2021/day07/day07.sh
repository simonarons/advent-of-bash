#!/usr/bin/env bash
# Allow input from stdin or file, 'cause what more could one want?
[[ -t 0 ]] && { [[ -f $1 ]] && { input=$(<"$1"); input=( ${input//,/ } ); } || { echo "error: no input"; exit 1; }; } || { input=$(</dev/stdin); input=( ${input//,/ }); }

echo -n "1: "
for p in ${input[@]}; do f=0; for s in ${input[@]}; do ((s>p)) && ((f+=(s-p))) || ((f-=(s-p))); done; r+=($f); done; (tr ' ' '\n' | sort -nr | tail -1) <<< "${r[@]}"

echo -n "2: "
for a in ${input[@]}; do for b in ${input[@]}; do echo "$a $b"; done | awk '{ s=$1-$2; s<0 && s=-s; sum+=s*(s/2)+(s/2);} END { print sum }'; done | sort -nr | tail -1
