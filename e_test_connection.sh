#e_test_connection.sh
#!/bin/bash


DOMAIN="example.com"

# nslookup resolve domain
if nslookup "$DOMAIN" >/dev/null 2>&1; then
    IP=$(nslookup "$DOMAIN" | awk '/^Address: / { print $2 }')
    echo "DNS resolution successful. $DOMAIN resolves to $IP"
else
    echo "DNS resolution failed for $DOMAIN."
fi
