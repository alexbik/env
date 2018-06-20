alias ls='ls --color=auto'
alias l='ls -Flah --color=auto'
alias sort='sort -S1G'
alias gh='cat $HOME/.shell.log | grep '
alias grep='grep -i --color=auto'
alias grepip='egrep "^([0-9]+\.){3}[0-9]+($|[/:])"'
alias grepc='find . \( -name \*.cpp -o -name \*.h -o -name \*.cc -o -name \*.hh -o -name \*.c -o -name \*.java -o -name \*.l -o -name \*.py -o -name \*.rl -o -name \*.inc \) | xargs grep -n'
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'

alias normsrc='sed -E -e "s/    /    /g" | sed -e "s/ *$//"'
alias list='find . 2>&1 | grep'
alias xrun='xargs -I{} bash -c "{}"'

# enable color in grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
