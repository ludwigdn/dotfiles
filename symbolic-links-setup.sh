echo 'Adding .vimrc' \
&& rm ~/.vimrc > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/nvim/.vimrc ~/.vimrc

echo 'Adding vimsplit folder' \
&& rm -rf ~/.vimsplit > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/nvim/.vimsplit ~/.vimsplit

echo 'Adding tmux.conf' \
&& rm -rf ~/tmux.conf > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/tmux/tmux.conf ~/tmux.conf
