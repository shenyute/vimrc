#!/bin/sh
cd ..
ln -s vimrc/vimrc .vimrc
ln -s vimrc .vim
ln -s vimrc/bashrc .bashrc
ln -s vimrc/screenrc .screenrc
ln -s vimrc/tmux.conf .tmux.conf
cd .vim
git submodule init
git submodule update

