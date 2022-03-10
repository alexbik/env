#!/usr/bin/env bash
# Run with full path, e.g. ~/git/env/setup.sh

# Create dir for old env settings
if [ ! -d $OLD_ENV_DIR ]; then
  echo "Creating $OLD_ENV_DIR"
  mkdir -p $OLD_ENV_DIR
fi

SETUP_DIR=$(dirname "${0}");  # Normally ~/git/env
source $SETUP_DIR/.bash-common
# Create symlinks to .{bash,vim}rc directly, back up old versions if necessary
for f in .bashrc .vimrc .bash-common; do
  echo $f;
  if [ -f ~/$f ]; then
    echo "Moving existing ~/$f to $OLD_ENV_DIR";
    mv ~/$f $OLD_ENV_DIR;
  fi
  echo "Creating symlink ~/$f -> $SETUP_DIR/$f";
  ln -s $SETUP_DIR/$f ~/$f;
done

# Create symlinks to additional .bash* files
if [ ! -d $BASH_EXTRA_DIR ]; then
  echo "Creating $BASH_EXTRA_DIR"
  mkdir -p $BASH_EXTRA_DIR
fi

for f in $SETUP_DIR/.bash_*; do
  if [ ! -f $BASH_EXTRA_DIR/$(basename $f) ]; then
    echo "Creating symlink $BASH_EXTRA_DIR/$f -> $f";
    ln -s $f $BASH_EXTRA_DIR/$(basename $f);
  fi
done

# Create symlink to the tips dir
if [ ! -d $TIPS_DIR ]; then
  echo "Creating symlink $TIPS_DIR -> $SETUP_DIR/.tips"
  ln -s $SETUP_DIR/.tips $TIPS_DIR;
fi
