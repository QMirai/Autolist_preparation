#!/bin/bash

grew compile -i eng_fre_sud.json

for type in "raising_verb" # "control_verb"
do
	lang="eng"
	input_dir="/mnt/hgfs/share/req/req_${lang}_${type}"
	echo "\n-----$type-----"
	output_dir="/mnt/hgfs/share/grew_output/grew_output_${input_dir##*/${lang}_"
	mkdir -p "$output_dir"

	for file in "$input_dir"/*.req
	do
		echo "Processing $file"
		filename=$(basename -- "$file")
		filename="${filename%.*}"
		grew grep -request $file -i eng_fre_sud.json > "$output_dir"/output_sud_"$filename".json
	done
done

echo "Finished!"