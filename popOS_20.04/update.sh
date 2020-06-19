#!/usr/bin/env bash
# Update necessary configs
set -x

update_configs () {
  cp ${HOME}/.bashrc .
  cp ${HOME}/.zshrc .
  cp ${HOME}/.config/libinput-gestures.conf .
}

update_configs
