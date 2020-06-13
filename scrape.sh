mkdir -p downloads
mkdir wget-temp
cd wget-temp
echo "Starting Link Retrieval From $1"
wget -r -np --spider $1 2>&1 -P wget-temp/ | awk -f filter.awk | uniq > links.txt
echo "Starting Download"
while read url; do axel -n 10 -c $url; done < links.txt
#cleanup
rmdir wget-temp
rm links.txt
echo "Download Complete!"

