#!/usr/bin/env bash

# Remove install files
rm -rf ~/Downloads/{*.deb}

# Clean docker cache
docker system prune -a

# Clean trash
rm -rf ~/.local/share/Trash/files/*
rm -rf ~/.local/share/Trash/info/*



