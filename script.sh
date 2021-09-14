#!/bin/bash
declare -A unitTests
unitTests["blocktest"]="experiments/blocks-test/blocks-test.tar.bz2"
unitTests["test"]="experiments/blocks-test/block-words_p01_hyp-0_10_0.tar.bz2"
# PARAMETERS #

# Three parameters
inputDir=$1
outputDir=$2
action=$3 # <-filter | -goalcompletion | -uniqueness>
threshold=$4 # <threshold_value>

echo $inputDir
for fname in $(find $inputDir -name '*.tar.bz2'); do
	if ! [[ $fname =~ .*FILTERED\.tar\.bz2 ]]; then
		echo $fname
		DIR=output/"${fname}""${action}""${threshold}".txt
		mkdir -p "${DIR%/*}"
		java -jar goalrecognizer1.2.jar "${action}" "${fname}" "${threshold}" > output/"${fname}""${action}""${threshold}".txt
	fi
done



