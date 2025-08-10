#!/bin/env bash

# This is a script to generate links and folder to make my config work

echo "config"
rsync -a --delete ~/.setup/dotfiles/dunst ~/.config/
rsync -a --delete ~/.setup/dotfiles/eww ~/.config/
rsync -a --delete ~/.setup/dotfiles/rofi ~/.config/
rsync -a --delete ~/.setup/dotfiles/sway ~/.config/
rsync -a --delete ~/.setup/dotfiles/swaylock ~/.config/
rsync -a --delete ~/.setup/dotfiles/wezterm ~/.config/

echo "local"
rsync -a --delete ~/.setup/dotfiles/bin ~/.local/
rsync -a --delete ~/.setup/dotfiles/imgs ~/.local/

echo "home"
rsync -a --delete ~/.setup/dotfiles/home/config ~/.ssh/config
rsync -a --delete ~/.setup/dotfiles/home/p10k.zsh ~/.p10k.zsh
rsync -a --delete ~/.setup/dotfiles/home/zlogin ~/.zlogin
rsync -a --delete ~/.setup/dotfiles/home/zshrc ~/.zshrc
