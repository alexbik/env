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

alias inst="sudo aptitude install -y"
alias remp="sudo aptitude purge"

