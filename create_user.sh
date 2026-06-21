#!/bin/bash
#create_user.sh

#1.  The script must take an argument for the username and verify that the argument is provided by producing an error message if it is not.

if [[ $EUID -ne 0 ]]; then
    exec sudo "$0" "$@"
fi

USERNAME="${1-}"

if [[ -z "$USERNAME" ]]
then
    echo "Error: No username argument provided."
    exit 1
fi

#2.  If the group "dev_group" does not exist, create it.

groupadd -f dev_group

#3.  The script must add a user and assign a password.

useradd -m -G dev_group "$USERNAME"
chpasswd <<< "${USERNAME}:tempPassword"
passwd -e "$USERNAME"
