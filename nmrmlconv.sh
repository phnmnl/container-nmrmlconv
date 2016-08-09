#!/bin/bash

echo $#
echo $*

venformat="$1"
zipfile="$2"
infile="$3"			#"BPA_c21_aq_126-BPA25ng/1"
outfile="$4"

ls -al /data
unzip $zipfile

java -jar /usr/local/share/nmrML/converter.jar -l create -b -z -t $venformat -i $infile -o $outfile


