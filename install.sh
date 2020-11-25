#!/bin/sh

cd -P $(dirname $0)

mkdir -p $HOME/.vim/colors
mv molokai.vim $HOME/.vim/colors
mv vimrc $HOME/.vimrc
