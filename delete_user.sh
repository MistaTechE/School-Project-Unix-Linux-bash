#!/bin/bash
#delete_user.sh


#1.  The script must take an argument for the username and verify that the argument is provided by producing an error message if it is not.

if [[ -z "${1-}" ]]; then
    echo "Error: No username provided."
    exit 1
fi

USERNAME="$1"

#2.  The script must ask for confirmation to delete the user.
echo "Are you absolutely sure you want to delete user '$USERNAME'? (y/n)"
read -r CONFIRM

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    exit 0
fi

#3.  The script must delete the user and the home directories and verify that each argument is provided by producing an error message if it is not.
userdel -r "$USERNAME"

if id "$USERNAME" &>/dev/null; then
    echo "Error: User was not deleted successfully."
else
    echo "User '$USERNAME' deleted successfully."

    #4.  The script must display the /etc/passwd file to verify the user deletion.
    cat /etc/passwd | grep "$USERNAME" || echo "User not found in /etc/passwd (confirmed deleted)."
fi

