#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root (sudo bash scrape.sh -link here- should do it"
  exit
fi

if ! command -v wget &> /dev/null
then
    echo "wget appears to not be installed, installing" && sudo apt install wget 
fi

if ! command -v axel &> /dev/null
then
    echo "axel appears to not be installed, installing" && sudo apt install axel
fi

if [ $# -eq 0 ]
  then
    echo "Please add a link: ex. sudo bash scrape.sh http://example.com/directory"
    exit
fi

mkdir -p downloads
mkdir -p wget-temp
cp filter.awk wget-temp/
cd wget-temp
echo "Starting Link Retrieval From $1"
wget -r -np --spider $1 2>&1 | awk -f filter.awk | uniq > links.txt
echo "Starting Download"
cd ..
while read url; do axel -n 10 -o downloads/ $url; done < wget-temp/links.txt
#cleanup
rm -r  wget-temp
echo "Download Complete!"

