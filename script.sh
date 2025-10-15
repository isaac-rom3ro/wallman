#!/bin/bash
echo RUNNING...

PACKAGE="feh"
BG=$1

if apt list --installed 2>/dev/null | grep -q "^$PACKAGE/"; then
	feh --bg-scale $BG
else
	echo "not installed"
fi




