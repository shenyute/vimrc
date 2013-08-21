#!/bin/sh
cd ..
ln -s vimrc/vimrc .vimrc
ln -s vimrc .vim
ln -s vimrc/bashrc .bash_aliases
ln -s vimrc/screenrc .screenrc
ln -s vimrc/tmux.conf .tmux.conf
mkdir ~/bin
cp vimrc/gid_with_col.py ~/bin
cd .vim
git submodule init
git submodule update
git clone https://github.com/gmarik/vundle.git bundle/vundle

# install all bundle module vundle
vim +BundleInstall +qall

# need vim7.3.584
cd bundle/YouCompleteMe
./install.sh --clang-completer
