#!/usr/bin/env bash

# Create dir for old env settings
OLD_ENV_DIR=~/env.old;
if [ ! -f $OLD_ENV_DIR ]; then
  echo "Creating $OLD_ENV_DIR"
  mkdir -p $OLD_ENV_DIR
fi

SETUP_DIR=$(dirname "${0}");
for f in .bashrc .bash_aliases .vimrc; do
  echo $f;
  if [ -f ~/$f ]; then
    echo "Moving existing ~/$f to $OLD_ENV_DIR";
    mv ~/$f $OLD_ENV_DIR;
  fi
  echo "Creating symlink ~/$f -> $SETUP_DIR/$f";
  ln -s $SETUP_DIR/$f ~/$f;
done
