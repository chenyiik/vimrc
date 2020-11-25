#!/bin/sh

cd -P $(dirname $0)

[ "$HOME" == "" ] && exit

mkdir -p $HOME/.vim/colors
mv molokai.vim !:2
mv vimrc $HOME/.vimrc
