#!/bin/bash

echo "IF THERE ARE BINARY FILES IN THIS DIRECTORY YOU WILL BE SAD!"
sleep 1
echo "...Trust me. I would know."
sleep 1
echo "......You have ten seconds."
sleep 10

#Remove trailing whitespace
sed -i 's/[[:space:]]*$//' ./*.*
#Remove extra EOL at EOF
sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' ./*.*
#Remove extra spaces before tabs in indent
sed -i 's/ \+\t/\t/g' ./*.*
