#e_test_DNS.sh
#!/bin/bash


TARGET="8.8.8.8"

#ping once 2 sec timeout
if ping -c 1 -W 2 "$TARGET" >/dev/null 2>&1; then
    echo "Connection to $TARGET is successful."
else
    echo "Cannot reach $TARGET."
fi
