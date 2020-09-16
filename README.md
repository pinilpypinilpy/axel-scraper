# axel-scraper
scrapes and downloads over multiple connections using axel and wget

Usage:

sudo apt install git

git clone https://github.com/pinilpypinilpy/axel-scraper/

cd axel-scraper

sudo bash scrape.sh http://your.url.here/your/target/directory/here/

output files are stored in the "downloads" directory


fixed issue where the "wget-temp" folder wasn't successfully removed if there were files/folders inside, which there always is after a link retrieval :/
