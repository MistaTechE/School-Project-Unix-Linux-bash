#d_2_run_updates.sh
#!/bin/bash
#WGU
#D796 - Unix and Linux
# Author: Evan Meserve
# Student ID 011285590

LOGFILE="$HOME/update.log"

echo "Starting system update..."
echo "Logging output to $LOGFILE"

# Detect package manager and run update
if command -v apt-get >/dev/null 2>&1; then
    echo "Using apt package manager..."
    sudo apt-get update 2>&1 | tee -a "$LOGFILE"
    sudo apt-get upgrade -y 2>&1 | tee -a "$LOGFILE"
elif command -v dnf >/dev/null 2>&1; then
    echo "Using dnf package manager..."
    sudo dnf check-update 2>&1 | tee -a "$LOGFILE"
    sudo dnf upgrade -y 2>&1 | tee -a "$LOGFILE"
elif command -v yum >/dev/null 2>&1; then
    echo "Using yum package manager..."
    sudo yum check-update 2>&1 | tee -a "$LOGFILE"
    sudo yum update -y 2>&1 | tee -a "$LOGFILE"
else
    echo "No supported package manager found (apt, dnf, yum). Cannot update."
    exit 1
fi

echo "Update complete. Log saved to $LOGFILE"