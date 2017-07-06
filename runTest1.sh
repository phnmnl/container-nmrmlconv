#!/bin/bash

cd /data

# Fetch RAW data
wget -O test.zip 'https://github.com/phnmnl/container-nmrmlconv/raw/develop/BPA_c21_aq_126-BPA25ng.zip'
unzip -q -d /data/test test.zip

# Conversion
java -jar /usr/local/share/nmrML/converter.jar -l create -b -z -t Bruker -i /data/test/ -o /data/test.nmrML

# Fetch expected output
wget -O expected.nmrML 'https://raw.githubusercontent.com/phnmnl/container-nmrmlconv/develop/BPA_c21_aq_126-BPA25ng.nmrML'

# Compare
cmp --silent expected.nmrML test.nmrML

if [[ $? -eq 0 ]]; then
	echo "Files are identical."
else
	echo "Error! Files are not identical."
	exit 2
fi

