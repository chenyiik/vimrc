#!/bin/sh

cd -P $(dirname $0)

mkdir -p $HOME/.vim/colors
cp molokai.vim $HOME/.vim/colors
cp vimrc $HOME/.vimrc
