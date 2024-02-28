#!/bin/bash

grew compile -i eng_fre_sud.json

echo "re, rf, ce, cf"
read v_l

if [ "$v_l"=="re" ]; then
	lang="eng"
	v_type="raising"
elif [ "$v_l"=="rf" ]; then
    	lang="fre"
    	v_type="raising"
elif [ "$v_l"=="ce" ]; then
    	lang="eng"
    	v_type="control"
elif [ "$v_l"=="cf" ]; then
    	lang="fre"
    	v_type="control"
else
	echo "$v_l not accepted"
	exit 1
fi
	
input_dir="/mnt/hgfs/share/req/req_${lang}_${v_type}_verb"
echo "\n----- ($lang) $v_type verb-----"
output_dir="/mnt/hgfs/share/grew_output/grew_output_${input_dir##*/req_}"
mkdir -p "$output_dir"

for file in "$input_dir"/*.req
do
	echo "Processing $file"
	filename=$(basename -- "$file")
	filename="${filename%.*}"
	grew grep -request $file -i eng_fre_sud.json > "$output_dir"/output_sud_"$filename".json
done


echo "Finished!"