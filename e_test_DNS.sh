#e_test_DNS.sh
#!/bin/bash
#WGU
#D796 - Unix and Linux
# Author: Evan Meserve
# Student ID 011285590

TARGET="8.8.8.8"

# Ping once 2 sec timeout
if ping -c 1 -W 2 "$TARGET" >/dev/null 2>&1; then
    echo "Connection to $TARGET is successful."
else
    echo "Cannot reach $TARGET."
fi
