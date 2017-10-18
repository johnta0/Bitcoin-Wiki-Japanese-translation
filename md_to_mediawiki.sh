#!/bin/bash

file_names=("README" "Script" "Transaction")

for item in ${file_names[@]}; do
  pandoc -f markdown -t mediawiki -o ${item}.mediawiki ${item}.md
done

