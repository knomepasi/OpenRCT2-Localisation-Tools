#!/bin/bash

# Creates an OpenRCT2 translation file from a Gettext translation (.po) file
# Usage: openrct2-po2txt.sh language
# Example: openrct2-po2txt.sh fi-FI

source="${1}.po"
i="1"

while IFS= read -r line
do
	if [[ $line =~ ^msgctxt.* ]]
	then
		j=$((i+2))
		str_id="${line:9:8}"
		str_raw=`sed "${j}q;d" $source`
		str=`echo "$str_raw" | cut -d'"' -f 2`
		echo $str_id"    :"$str
	fi
	i=$((i+1))
done < "$source"

