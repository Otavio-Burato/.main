#! /usr/bin/env bash

check=true
check_comand()
{
    PROC_NAME=$1
    line='                                                     '
    if which $1 > /dev/null 2>&1; then
        printf "%s %s [OK]\n" $PROC_NAME "${line:${#PROC_NAME}}"
    else
        printf "%s %s [FAIL]\n" $PROC_NAME "${line:${#PROC_NAME}}"
        check=false
    fi
}

check_comand sk
check_comand exa
check_comand bat
check_comand hyperfine
check_comand btm
check_comand fd
check_comand dust
check_comand alacritty
check_comand starship
check_comand i3status-rs
check_comand grim
check_comand wf-recorder
check_comand rg
check_comand slurp
check_comand mako
check_comand swaylock
check_comand swayidle
check_comand hexyl
check_comand tab

if $check; then
    echo "Create Dir"
    mkdir -p $HOME/.config/alacritty
    mkdir -p $HOME/.config/sway
    mkdir -p $HOME/.config/gtk-3.0
    mkdir -p $HOME/.config/nvim
    echo ''
    echo "Start linkin"
    ln $HOME/.main/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
    ln $HOME/.main/zsh/zshrc $HOME/.zshrc
    ln $HOME/.main/sway/config $HOME/.config/sway/config
    ln $HOME/.main/sway/config.toml $HOME/.config/sway/config.toml
    ln $HOME/.main/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
    ln $HOME/.main/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
    ln $HOME/.main/nvim/init.vim $HOME/.config/nvim/init.vim
    ln $HOME/.main/star/starship.toml $HOME/.config/starship.toml
fi
