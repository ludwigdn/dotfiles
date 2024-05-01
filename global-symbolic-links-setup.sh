#!/bin/bash

mkdir ~/code > /dev/null 2>&1

sh ./zsh/symbolic-links-setup.sh
sh ./git/symbolic-links-setup.sh
sh ./nvim/symbolic-links-setup.sh
sh ./tmux/symbolic-links-setup.sh
