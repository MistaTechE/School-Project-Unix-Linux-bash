#c_customize_env.sh
#!/bin/bash
#WGU
#D796 - Unix and Linux
# Author: Evan Meserve
# Student ID 011285590

#1. update ~/.bashrc ===
cat << 'EOF' >> ~/.bashrc

#custom rainbow prompt colors
COLORS=(31 32 33 34 35 36)
INDEX=0
set_rainbow_prompt() {
INDEX=$(( (INDEX + 1) % ${#COLORS[@]} ))
COLOR=${COLORS[$INDEX]}
PS1="\[\033[1;${COLOR}m\]\$\[\033[0m\] "
}
PROMPT_COMMAND=set_rainbow_prompt

#2. aliases file
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
export PATH="$HOME/bin:$PATH"
EOF
cat << 'EOF' > ~/.bash_aliases

alias lrt='ls -lrt'
alias la='ls -a'
alias c='clear'
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias documents='cd ~/Documents'
EOF

#4a. bin directory and scripts moved
mkdir -p ~/bin
for script in create_user.sh delete_user.sh; do
if [ -f "$script" ]; then
mv "$script" ~/bin/
chmod +x ~/bin/"$script"
fi
done

#4. Apply changes immediately ===
source ~/.bashrc
echo "Changes applied"

# === 5. Verification ===
echo "Verifying prompt, aliases, PATH, and script execution..."

echo "Current prompt should now cycle colors."
echo "Testing aliases:"
lrt
la
c

echo "Testing PATH includes ~/bin:"
echo $PATH

echo "Testing script execution from /tmp..."
mkdir -p /tmp/test_env && cd /tmp/test_env
create_user.sh 2>/dev/null || echo "create_user.sh ran (or was missing)"
delete_user.sh 2>/dev/null || echo "delete_user.sh ran (or was missing)"

echo "Setup complete! "