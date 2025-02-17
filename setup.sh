#!/bin/bash

setupSSH() {
  mkdir -p ~/.ssh

  echo "
Host github.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_personal

Host gitlab.com
   HostName gitlab.com
   User git
   IdentityFile ~/.ssh/id_gitlab

Host github-work.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_work
" >> ~/.ssh/config

  # Add SSH keys
  ssh-keygen -t rsa -f ~/.ssh/id_personal -N ""
  ssh-keygen -t rsa -f ~/.ssh/id_gitlab -N ""
  ssh-keygen -t rsa -f ~/.ssh/id_work -N ""

  # Add SSH keys to ssh-agent
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_personal
  ssh-add ~/.ssh/id_gitlab
  ssh-add ~/.ssh/id_work
}

# Check if SSH config already contains our entries
if ! grep -q "Host github.com" ~/.ssh/config 2>/dev/null; then
  setupSSH
fi

# Stow configurations
stow nvim
stow i3
stow i3blocks
stow fish
stow git
stow bashrc
