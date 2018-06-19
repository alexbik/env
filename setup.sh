#!/usr/bin/env bash

# Create dir for old env settings
OLD_ENV_DIR=~/env.old;
if [ ! -f $OLD_ENV_DIR ]; then
  echo "Creating $OLD_ENV_DIR"
  mkdir -p $OLD_ENV_DIR
fi

SETUP_DIR=$(dirname "${0}");  # Normally ~/git/env
# Create symlinks to .{bash,vim}rc directly, back up old versions if necessary
for f in .bashrc .vimrc; do
  echo $f;
  if [ -f ~/$f ]; then
    echo "Moving existing ~/$f to $OLD_ENV_DIR";
    mv ~/$f $OLD_ENV_DIR;
  fi
  echo "Creating symlink ~/$f -> $SETUP_DIR/$f";
  ln -s $SETUP_DIR/$f ~/$f;
done

# Create symlinks to additional .bash* files
BASH_EXTRA_DIR=~/.bash
if [ ! -f $BASH_EXTRA_DIR ]; then
  echo "Creating $BASH_EXTRA_DIR"
  mkdir -p $BASH_EXTRA_DIR
fi

for f in aliases functions; do
  if [ ! -f $BASH_EXTRA_DIR/$f ]; then
    echo "Creating symlink to $BASH_EXTRA_DIR/$f -> $SETUP_DIR/.bash_$f";
    ln -s $SETUP_DIR/.bash_$f $BASH_EXTRA_DIR/$f;
  fi
done

# Add deps
inst build-essential cmake python-dev python3-dev exuberant-ctags
