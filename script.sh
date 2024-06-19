#!/bin/bash

# Define dotfiles directory
DOTFILES_DIR=~/dotfiles

# # Create necessary directory structure for Neovim, i3, i3blocks, and Fish
# mkdir -p $DOTFILES_DIR/nvim/.config/nvim
# mkdir -p $DOTFILES_DIR/i3/.config/i3
# mkdir -p $DOTFILES_DIR/i3blocks/.config/i3blocks
mkdir -p $DOTFILES_DIR/fish/.config/fish

# # Move existing configurations to the dotfiles directory
# if [ -d ~/.config/nvim ]; then
#   mv ~/.config/nvim/* $DOTFILES_DIR/nvim/.config/nvim/
# fi

# if [ -d ~/.config/i3 ]; then
#   mv ~/.config/i3/* $DOTFILES_DIR/i3/.config/i3/
# fi

# if [ -d ~/.config/i3blocks ]; then
#   mv ~/.config/i3blocks/* $DOTFILES_DIR/i3blocks/.config/i3blocks/
# fi

if [ -d ~/.config/fish ]; then
  mv ~/.config/fish/* $DOTFILES_DIR/fish/.config/fish/
fi

# Use stow to create symbolic links
cd $DOTFILES_DIR
# stow nvim
# stow i3
# stow i3blocks
stow fish

# Verify the symlinks
echo "Verifying symlinks..."
# echo "Neovim:"
# ls -l ~/.config/nvim
# echo "i3:"
# ls -l ~/.config/i3
# echo "i3blocks:"
# ls -l ~/.config/i3blocks
echo "Fish:"
ls -l ~/.config/fish

echo "Setup complete."
