#g_archive_compress.sh
#!/bin/bash
#WGU
#D796 - Unix and Linux
# Author: Evan Meserve
# Student ID 011285590

#1. function to get file size
fileSize() {
    FILE="$1"
    if [ -f "$FILE" ]; then
        stat -c%s "$FILE"
    else
        echo 0
    fi
}

#2. archive and compress with gzip
GZIP_FILE="etc_archive.tar.gz"
sudo tar -czf "$GZIP_FILE" /etc

#3. archive and compress with bzip2
BZIP_FILE="etc_archive.tar.bz2"
sudo tar -cjf "$BZIP_FILE" /etc

#4. calculate sizes
GZIP_SIZE=$(fileSize "$GZIP_FILE")
BZIP_SIZE=$(fileSize "$BZIP_FILE")

#5. print the difference in size between compression algorithms
DIFF=$((GZIP_SIZE - BZIP_SIZE))
echo "Size difference (gzip - bzip2): $DIFF bytes"
els
    echo "Both archives are the same size."
fi

echo "Archive and compression compl
