#!/bin/bash

source_pot="openrct2.pot"
language=$1

echo "msgid \"\""
echo "msgstr \"\""
echo "\"Project-Id-Version: OpenRCT2\n\""
echo "\"POT-Creation-Date: `date -u`\n\""
echo "\"PO-Revision-Date: \n\""
echo "\"Language-Team: $language\n\""
echo "\"MIME-Version: 1.0\n\""
echo "\"Content-Type: text/plain; charset=UTF-8\n\""
echo "\"Content-Transfer-Encoding: 8bit\n\""
echo "\"X-Generator: \n\""
echo "\"Last-Translator: \n\""
echo "\"Plural-Forms: nplurals=2; plural=(n != 1);\n\""
echo "\"Language: $language\n\""
echo ""

source="$1.txt"
i="1"

while IFS=: read -r str_id str
do
	if [[ $str_id =~ ^#.* ]]
	then
		continue
	else
		echo "#: $str_id" | xargs
		echo "msgctxt \"$str_id\""
		source_line=`grep -n "msgctxt \"$str_id" ${source_pot} | awk -F ":" '{print $1}'`
		j=$(($source_line+1))
		source_str_raw=`sed "${j}q;d" $source_pot`
		echo $source_str_raw
		echo "msgstr \"$str\""
		echo ""
	fi
done < "$source"

