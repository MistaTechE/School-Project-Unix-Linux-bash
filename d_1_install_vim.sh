#d_1_install_vim.sh
#!/bin/bash


# detect package manager and install Vim
if command -v vim >/dev/null 2>&1; then
    echo "Vim is already installed."
else
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y vim
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y vim
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y vim
    else
        echo "error"
        exit 1
    fi
fi
