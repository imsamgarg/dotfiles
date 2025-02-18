#!/bin/bash

mem="$( free --giga -h | grep 'Mem' || true )"
total="$( echo "${mem}" | awk '{printf("%d\n", $2)}' )"
used="$( echo "${mem}" | awk '{printf("%d\n", $3)}' )"
pused="$( awk -v total="${total}" -v used="${used}" 'BEGIN {printf("%d\n", (100 * used) / total)}' )"

# echo "${used}G (${pused}%)"
echo "${pused}%"
