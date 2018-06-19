#!/usr/bin/env bash

# Compiler functions
compile_cpp()
{
    g++ -Wall -W -O2 -s -pipe -o $1 *.cpp
}


# Remote setup and execution functions
cpauthssh()
{
  SERVER=$1
  echo copy to $SERVER
  ssh $SERVER "rm -rf .ssh"
  scp -rp ~/.ssh $SERVER:
}

mkhome()
{
  USER=$1
  mkdir /home/$1
  chown $1:$1 /home/$1
  chmod g-w /home/$1
}

nicehup()
{
  CMD=$1
  nohup nice -n 20 $CMD </dev/null >nohup.out 2>&1 &
}

# String functions
function grepsrc()
{
  grep -n $* | awk -F: '{print "vim "$1" +"$2; $1=$2=""; print $0}'
}

function swapline()
{
  awk '$1 ~ "'$1'" {s=$0;getline;s=$0"\n"s;print s;next;}1'
}

function strarr()
{
  cat - | awk '{if (length(s)+length($1)>64){if(s!="")print \
               substr(s,0,length(s)-1);s="";}s=s"\""$1"\", ";}\
               END{if(s!="")print substr(s,0,length(s)-1);}'
}

# Misc functions
function histsnap()
{
  ls -alt $HOME/.snapshot/*.?/.bash_history ~/.bash_history
  cp `ls -aS $HOME/.snapshot/*.?/.bash_history ~/.bash_history | head -1` $HOME/.bash_history
}

extract () { # extract files. Ignore files with improper extensions.
    local x
    ee() { # echo and execute
        echo "$@"
        $1 "$2"
    }
    for x in "$@"; do
        [[ -f $x ]] || continue
        case "$x" in
            *.tar.bz2 | *.tbz2 )    ee "tar xvjf" "$x"  ;;
            *.tar.gz | *.tgz ) ee "tar xvzf" "$x"   ;;
            *.bz2 )             ee "bunzip2" "$x"   ;;
            *.rar )             ee "unrar x" "$x"   ;;
            *.gz )              ee "gunzip" "$x"    ;;
            *.tar )             ee "tar xvf" "$x"   ;;
            *.zip )             ee "unzip" "$x"     ;;
            *.Z )               ee "uncompress" "$x" ;;
            *.7z )              ee "7z x" "$x"      ;;
        esac
    done
}

tip()
{
  HELP_DIR=$HOME/.bash_help
  if [ -z "$1" ]; then
    ls $HELP_DIR
    return 1
  fi
  HELP_FILE=$HELP_DIR/$1
  if [ -r $HELP_FILE ]; then
    cat $HELP_FILE
  else
    man $1
  fi
}
