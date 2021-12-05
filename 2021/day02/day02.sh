#!/usr/bin/env bash
# Allow input from stdin or file, 'cause what more could one want?
[[ -t 0 ]] && { [[ -f $1 ]] && input=$(<"$1") || { echo "error: no input"; exit 1; }; } || input=$(</dev/stdin)

# Cut, paste and calculate!
a1=$(paste <(grep fo <<< "$input" | cut -d ' ' -f2) <(grep do <<< "$input" | cut -d ' ' -f2) <(grep up <<< "$input" | cut -d ' ' -f2) | awk '{f+=$1; d+=$2; u+=$3} END {printf "%d\n", f*(d-u);}')

# Why vile while loop? Because it's there.
a2=$(while read c v; do case $c in f*) ((p+=v)); ((d+=v*a)); ;; d*) ((a+=v)); ;; u*) ((a-=v)); ;; esac; done <<< "$input"; echo $((p*d)))

echo "1: $a1"
echo "2: $a2"
