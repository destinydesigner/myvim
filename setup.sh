#!/bin/sh -
# step 1: setup the links in Home directory
pushd ~

if [ -e '.vimrc' ]
then
    echo 'Moving .vimrc to .vimrc.bak ...'
    mv .vimrc .vimrc.bak
fi

echo 'Creating link .vimrc -> ~/myvim/.vimrc'
ln -s myvim/.vimrc

if [ -e '.vim' ]
then
    echo 'Moving .vim to .vim.bak ...'
    mv .vim .vim.bak
fi

echo 'Creating link .vim -> ~/myvim'
ln -s myvim .vim

# step 2: git submodule init and update
pushd myvim
git submodule init
git submodule update

dirs -c
