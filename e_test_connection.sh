#e_test_connection.sh
#!/bin/bash
#WGU
#D796 - Unix and Linux
# Author: Evan Meserve
# Student ID 011285590

DOMAIN="example.com"

# nslookup resolve domain
if nslookup "$DOMAIN" >/dev/null 2>&1; then
    IP=$(nslookup "$DOMAIN" | awk '/^Address: / { print $2 }')
    echo "DNS resolution successful. $DOMAIN resolves to $IP"
else
    echo "DNS resolution failed for $DOMAIN."
fi