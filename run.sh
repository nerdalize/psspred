#!/bin/bash

TMP_FILE="/tmp/sequence.fa"
OUTFILE=""

if [ -z "$1" ]
  then echo "Usage: $0 <BASE64-encoded input sequence>"
  exit 0
fi

# do not remove the quotes ` as the input may contain newlines
`echo $1 | base64 --decode > $TMP_FILE`

# echo "starting psspred with input:"
cat $TMP_FILE
echo ""

# clean up workdir
rm -rf /workdir

# create new one
mkdir -p /workdir
cd /workdir

/library/yzhang/PSSpred/PSSpred.pl $TMP_FILE

cat "seq.dat.ss" |  grep -v "coil  helix  beta" | awk -v OFS="\n" '{if($3 == "C") print "L:"$4;if($3 == "H") print "H:"$5; if($3 == "E") print "E:"$6;}' | tr "\n" "," > /workdir/output.txt

echo "process complete"
