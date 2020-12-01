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
check_comand codium

if $check; then
    mkdir -p $HOME/.config/alacritty
    mkdir -p $HOME/.config/sway
    mkdir -p $HOME/.config/gtk-3.0
    mkdir -p $HOME/.config/nvim
    ln $HOME/.main/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml 2> /dev/null
    ln $HOME/.main/zsh/zshrc $HOME/.zshrc 2> /dev/null
    ln $HOME/.main/sway/config $HOME/.config/sway/config 2> /dev/null
    ln $HOME/.main/sway/config.toml $HOME/.config/sway/config.toml 2> /dev/null
    ln $HOME/.main/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini 2> /dev/null
    ln $HOME/.main/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json 2> /dev/null
    ln $HOME/.main/nvim/init.vim $HOME/.config/nvim/init.vim 2> /dev/null
    ln $HOME/.main/star/starship.toml $HOME/.config/starship.toml 2> /dev/null
    echo 'OK!'
fi

FILE=$(xdg-user-dir PICTURES)/desktop.jpg
if [ ! -f "$FILE" ]; then
    curl https://images4.alphacoders.com/966/thumb-1920-966314.jpg --output $FILE
fi

