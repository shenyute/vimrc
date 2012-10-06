#!/bin/sh
cd ..
ln -s vimrc/vimrc .vimrc
ln -s vimrc .vim
ln -s vimrc/bashrc .bashrc
ln -s vimrc/screenrc .screenrc
ln -s vimrc/tmux.conf .tmux.conf
mkdir ~/bin
cp gid_with_col.py ~/bin
cd .vim
git submodule init
git submodule update

