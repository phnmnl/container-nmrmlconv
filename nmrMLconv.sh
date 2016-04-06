#!/bin/bash
JAVA="java"
NMRML_DIR="/usr/local/share/nmrML"
CONVERTER="$JAVA -cp ./ -jar $NMRML_DIR/converter.jar"

$CONVERTER $i*
 
