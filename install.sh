#!/bin/sh
cd ..
ln -s vimrc/vimrc2 .vimrc
ln -s vimrc .vim
ln -s vimrc/bashrc .bash_aliases
ln -s vimrc/screenrc .screenrc
ln -s vimrc/tmux.conf .tmux.conf
ln -s vimrc/gitconfig .gitconfig
ln -s vimrc/gdbinit .gdbinit
ln -s vimrc/gdb gdb

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

mkdir ~/bin
cp vimrc/gid_with_col.py ~/bin
cd .vim
#git submodule init
#git submodule update
#git clone https://github.com/gmarik/vundle.git bundle/vundle
#touch ~/.vimrc_private

# install all bundle module vundle
#vim +BundleInstall +qall

# need vim7.3.584
#cd bundle/YouCompleteMe
#./install.sh --clang-completer
