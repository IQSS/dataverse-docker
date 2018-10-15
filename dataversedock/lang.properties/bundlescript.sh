#!/bin/bash
initVersion=v4.8.6 # any version
endVersion=v4.9.4 # any version
tempDir=diffBundles
onlyLabels=true # diff labels or translations

mkdir $tempDir
wget -q https://raw.githubusercontent.com/IQSS/dataverse/"$initVersion"/src/main/java/Bundle.properties -O $tempDir/Bundle_$initVersion
wget -q https://raw.githubusercontent.com/IQSS/dataverse/"$endVersion"/src/main/java/Bundle.properties -O $tempDir/Bundle_$endVersion

if [[ $onlyLabelss -eq true ]]; then
  sort $tempDir/Bundle_$initVersion | uniq | grep "=" | grep -v "^#" | cut -d "=" -f 1 > $tempDir/Bundle_sorted_$initVersion
  sort $tempDir/Bundle_$endVersion | uniq | grep "=" | grep -v "^#"  | cut -d "=" -f 1 > $tempDir/Bundle_sorted_$endVersion
else 
  sort $tempDir/Bundle_$initVersion | uniq | grep "=" | grep -v "^#" > $tempDir/Bundle_sorted_$initVersion
  sort $tempDir/Bundle_$endVersion | uniq | grep "=" | grep -v "^#" > $tempDir/Bundle_sorted_$endVersion
fi

diff $tempDir/Bundle_sorted_$initVersion $tempDir/Bundle_sorted_$endVersion | grep -v "^---" | grep -v "^[0-9c0-9]" | sed -e "s/> //g" > $tempDir/diffs
grep -f $tempDir/diffs $tempDir/Bundle_$endVersion
