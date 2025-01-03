#!/usr/bin/env bash

s=$(iostat | head -n4 | tail -n1 | awk '{ print $4}')
echo $s

