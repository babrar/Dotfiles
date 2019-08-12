#!/usr/bin/env bash
# Update necessary configs
set -ex

update_configs () {
  cp ${HOME}/.bashrc .
  cp ${HOME}/.zshrc .
  cp ${HOME}/.tmux.conf .
  cp ${HOME}/.vimrc .
}

update_configs
