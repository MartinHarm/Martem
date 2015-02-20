#!/bin/bash -e

if [ -z "$1" ]

then
	MEMTOTAL=$(grep -E -o 'MemTotal.*[0-9]{1,}' /proc/meminfo | grep -o -E '[0-9]{1,}')
	MEMFREE=$(grep -E -o 'MemFree.*[0-9]{1,}' /proc/meminfo | grep -o -E '[0-9]{1,}')
else
	MEMTOTAL=$(grep -E -o 'MemTotal.*[0-9]{1,}' $1 | grep -o -E '[0-9]{1,}')
	MEMFREE=$(grep -E -o 'MemFree.*[0-9]{1,}' $1 | grep -o -E '[0-9]{1,}')
fi


MEMUSED=$(((MEMTOTAL-MEMFREE)/1024))
MEMTOTAL=$((MEMTOTAL/1024))
MEMFREE=$((MEMFREE/1024))

echo "RAM: ${MEMUSED} MB used / ${MEMTOTAL} MB total (${MEMFREE} MB free)"
