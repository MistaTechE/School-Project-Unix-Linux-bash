#d_2_run_updates.sh
#!/bin/bash


LOGFILE="$HOME/update.log"

# detect package manager and update
if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update 2>&1 | tee -a "$LOGFILE"
    sudo apt-get upgrade -y 2>&1 | tee -a "$LOGFILE"
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf check-update 2>&1 | tee -a "$LOGFILE"
    sudo dnf upgrade -y 2>&1 | tee -a "$LOGFILE"
elif command -v yum >/dev/null 2>&1; then
    sudo yum check-update 2>&1 | tee -a "$LOGFILE"
    sudo yum update -y 2>&1 | tee -a "$LOGFILE"
else
    echo "error"
    exit 1
fi
