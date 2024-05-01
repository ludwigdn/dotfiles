export CODE_HOME="$HOME/code"

echo 'Adding .gitconfig' \
&& rm -f ~/.gitconfig > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/git/.gitconfig ~/.gitconfig

echo 'Adding .gitignore' \
&& rm -f ~/.gitignore > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/git/.gitignore ~/.gitignore
