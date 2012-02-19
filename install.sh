#!/bin/sh
cd ..
ln -s vimrc/vimrc .vimrc
ln -s vimrc .vim
cd .vimrc
git submodule init
git submodule update

