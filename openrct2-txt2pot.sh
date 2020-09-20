#!/bin/bash
# Outputs a Gettext template (.pot) file from the source strings
# Usage: openrct2-txt2pot.sh >openrct2.pot

# Source file is currently read locally
# TODO: Read from the main repository when the script is able to handle the scenario translations
source="en-GB.txt"

echo "#, fuzzy"
echo "msgid \"\""
echo "msgstr \"\""
echo "\"Project-Id-Version: OpenRCT2\n\""
echo "\"POT-Creation-Date: `date -u`\n\""
echo "\"PO-Revision-Date: \n\""
echo "\"Last-Translator: \n\""
echo "\"Language-Team: \n\""
echo "\"MIME-Version: 1.0\n\""
echo "\"Content-Type: text/plain; charset=UTF-8\n\""
echo "\"Content-Transfer-Encoding: 8bit\n\""
echo "\"X-Generator: \n\""
echo ""

while IFS=: read -r str_id str
do
	if [[ $str_id =~ ^#.* ]]
	then
		echo "$str_id"
	else
		echo "#: $str_id" | xargs
		echo "msgctxt \"$str_id\""
		echo "msgid \"$str\""
		echo "msgstr \"\""
		echo ""
	fi
done < "$source"

