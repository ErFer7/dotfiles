#!/usr/bin/env bash

# Save konsole configs
mkdir -p ./home
mkdir -p ./home/.config
mkdir -p ./home/.local/share
mkdir -p ./home/.local/share/kxmlgui5
mkdir -p ./home/.oh-my-zsh/custom

cp -f ~/.config/konsolerc ./home/.config
cp -rf ~/.local/share/konsole ./home/.local/share
cp -rf ~/.local/share/kxmlgui5/konsole ./home/.local/share/kxmlgui5

# Save ZSH configs
cp -f ~/.zshrc ./home

# Save aliases
cp -f ~/.bash_aliases ./home

# Save OMZ configs
cp -rf ~/.oh-my-zsh/custom/plugins ./home/.oh-my-zsh/custom
cp -rf ~/.oh-my-zsh/custom/themes ./home/.oh-my-zsh/custom
