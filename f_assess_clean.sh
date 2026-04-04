#f_assess_clean.sh
#!/bin/bash
#WGU
#D796 - Unix and Linux
# Author: Evan Meserve
# Student ID 011285590


#1. free disk space and store in variable
FREE_BEFORE=$(df / | awk 'NR==2 {print $4}')
echo "Free space before cleanup: $FREE_BEFORE KB"

#2.function to clean a directory
cleanDir() {
    DIR="$1"
    if [ -d "$DIR" ]; then
        echo "Cleaning directory: $DIR"
        rm -rf "$DIR"/*
    else
        echo "Directory not found: $DIR"
    fi
}

#3. list of directories
DIRS=("/var/log" "$HOME/.cache")

#4. clean directories
for DIR in "${DIRS[@]}"; do
    cleanDir "$DIR"
done

#5. calculate free disk space
FREE_AFTER=$(df / | awk 'NR==2 {print $4}')
FREED=$((FREE_AFTER - FREE_BEFORE))
if [ "$FREED" -gt 0 ]; then
    echo "Disk space freed: $FREED KB" 
else
    echo "No significant disk space was freed."
fi
