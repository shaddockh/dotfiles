#!/bin/bash
############################
# .make.sh
# This script creates symlinks for dotfiles in the dotfiles directory to the root
# from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="bashrc bash_profile vimrc vim zshrc oh-my-zsh tmux.conf"    # list of files/folders to symlink in homedir

##########

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
