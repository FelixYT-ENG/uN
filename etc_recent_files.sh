#!/bin/bash

find /etc -type f -mtime -30 -printf "%TY-%Tm-%Td %TH:%TM %s %p\n" | 
awk '{
    size = $3;
    units = "B";
    if (size > 1024) {size /= 1024; units = "KB"}
    if (size > 1024) {size /= 1024; units = "MB"}
    if (size > 1024) {size /= 1024; units = "GB"}
    printf "%-16s %7.1f %3s %s\n", $1" "$2, size, units, $4
}' | sort