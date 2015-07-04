#!/bin/sh
cp -rf .vimrc .vim .inputrc .bashrc .git .gitignore ~/

vim +PlugInstall
