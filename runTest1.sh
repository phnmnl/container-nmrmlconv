#!/bin/bash

venformat="$1"
zipfile="$2"
infile="$3"			#"BPA_c21_aq_126-BPA25ng/1"
outfile="$4"

cd /data
wget -O test.zip 'https://github.com/phnmnl/container-nmrmlconv/raw/develop/BPA_c21_aq_126-BPA25ng.zip'
unzip -q -d /data/test test.zip

java -jar /usr/local/share/nmrML/converter.jar -l create -b -z -t Bruker -i /data/test/ -o /data/test.nmrML


