#DOS Style Aliases
alias cls="clear"
alias dir="ls"
alias deltree="rm -r"
alias rmdir="rm -r"
alias rd="rm -r"
alias rename="mv"
alias chdir="pwd"
alias cmd="bash"
alias edit="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
alias erase="rm"
alias del="rm -rfi"
alias delete="rm -rfi"
alias expand="extract"
diskcopy(){ dd if=$1 of=$2; }
alias tasklist="htop"
alias tracert="traceroute"

# Find out what is taking so much space on your drives
alias diskspace="du -S | sort -n -r | less"

# Easy way to extract archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1;;
           *.tar.gz)    tar xvzf $1;;
           *.bz2)       bunzip2 $1 ;;
           *.rar)       unrar x $1 ;;
           *.gz)        gunzip $1  ;;
           *.tar)       tar xvf $1 ;;
           *.tbz2)      tar xvjf $1;;
           *.tgz)       tar xvzf $1;;
           *.zip)       unzip $1   ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1;;
           *) echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Quality of Life Flags
alias cp="cp -i"
alias rsync="rsync --recursive --stats --human-readable --progress"
alias grep="grep --color=auto"
alias ls="ls --color=auto -lahF"
alias mv="mv -i"
alias rm="rm -I"
alias please="sudo !!"
alias wget="wget -c"
alias search='set -f;search';search() { find . ${2:+-name "$2"} -type f -print0 | xargs -0 grep --color=auto "$1"; }
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias python='python3'
alias pip='pip3'
alias rcreload='source ~/.bashrc'
lc() { cd "$@" && ls; }
alias cd='lc'
alias ansiblepull='sudo ansible-pull -U https://github.com/MichelfrancisBustillos/ansible_pull.git --vault-password-file /home/michel/.vault_pass.txt'
alias ip='ip -color=auto -human-readable -pretty'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias grep='rg --smart-case --multiline --follow'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'

#Tail all logs in /var/log
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

alias nano='micro'
alias cat='batcat --paging=never'
alias glances='sudo /root/.local/bin/glances'
alias find='fdfind -X batcat'

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}