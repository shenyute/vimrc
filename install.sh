#!/bin/sh
cd ..
ln -s vimrc/vimrc .vimrc
ln -s vimrc .vim
cd .vimrc
git submodule init
git submodule update

# add new plugin with git submodule
# example:
# git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
# git add .
# git commit -m "Install Fugitive.vim bundle as a submodule."
