#!/bin/bash

OUTPUT_FOLDER=OUTPUT
DESIGN_FOLDER=design_test

rm -rf $OUTPUT_FOLDER

for dpi in hdpi  mdpi;
do
  ./flatten_folder.sh --src $DESIGN_FOLDER/$dpi  --dst $OUTPUT_FOLDER/$dpi
done





