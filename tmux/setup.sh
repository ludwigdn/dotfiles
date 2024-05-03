export CODE_HOME="$HOME/code"

echo 'Adding tmux.conf' \
&& rm -f ~/.tmux.conf > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/tmux/.tmux.conf ~/.tmux.conf
