#e_ping_google.sh
#!/bin/bash


TARGET="google.com"

#ping once 2 sec timeout
if ping -c 1 -W 2 "$TARGET" >/dev/null 2>&1; then
    echo "Network is up."
else
    echo "cannot reach network"
fi

