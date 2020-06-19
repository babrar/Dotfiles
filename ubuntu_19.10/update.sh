#!/usr/bin/env bash
# Update necessary configs
set -x

update_configs () {
  cp ${HOME}/.bashrc .
  cp ${HOME}/.zshrc .
  cp ${HOME}/.tmux.conf .
  cp ${HOME}/.vimrc .
  cp ${HOME}/.config/nvim/init.vim .
  cp ${HOME}/.config/alacritty/alacritty.yml .
  cp /etc/default/tlp ./tlp/
  cp ${HOME}/.config/libinput-gestures.conf .
}

update_configs
