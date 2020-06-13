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
rmdir wget-temp
echo "Download Complete!"

