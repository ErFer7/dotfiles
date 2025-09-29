#!/usr/bin/env bash

# Load konsole config
cp -f ./home/.config ~/.config/konsolerc
cp -rf ./home/.local/share/konsole ~/.local/share
cp -rf ./home/.local/share/kxmlgui5/konsole ~/.local/share/kxmlgui5

# Save ZSH configs
cp -f ./home/.zshrc ~/.zshrc

# Save aliases
cp -f ./home/.bash_aliases ~/.bash_aliases

# Save OMZ configs
cp -rf ./home/.oh-my-zsh/custom/plugins ~/.oh-my-zsh/custom
cp -rf ./home/.oh-my-zsh/custom/themes ~/.oh-my-zsh/custom
