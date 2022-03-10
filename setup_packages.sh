#!/usr/bin/env bash

# Add deps
sudo apt-get install -y aptitude
sudo aptitude install -y build-essential cmake python3-dev exuberant-ctags vim-nox mono-complete golang nodejs default-jdk npm
# Install YCM
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
