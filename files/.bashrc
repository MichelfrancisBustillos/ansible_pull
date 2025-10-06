# Exit if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

# Set Ansible Vault password file environment variable
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt

# Set MANPAGER to use batcat for man pages if available
if command -v batcat &>/dev/null; then
    export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | batcat -p -lman'"
fi

# Configure shell history behavior
HISTCONTROL=ignoreboth
shopt -s histappend autocd cdspell cdable_vars
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'

# Adjust window size after each command
shopt -s checkwinsize

# Use lesspipe for non-text input files if available
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set debian_chroot variable if in a chroot environment
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Configure colored prompt if terminal supports it
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[38;5;35m\]\u\[\e[0m\]@\[\e[38;5;35m\]\h\[\e[0m\]:\[\e[38;5;27m\]\w\n\[\e[0m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Load custom aliases if the file exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable bash completion if available
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# On login, clear the screen and show system info using fastfetch (if installed)
if command -v clear &>/dev/null; then clear; fi
if command -v fastfetch &>/dev/null; then fastfetch; fi

# Automatically attach or create a tmux session unless running in VSCode
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
        if ! tmux has-session -t default 2>/dev/null; then
            tmux new-session -s default
        else
            tmux attach-session -t default
        fi
    fi
fi