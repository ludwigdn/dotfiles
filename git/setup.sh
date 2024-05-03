export CODE_HOME="$HOME/code"

# Only adding this empty file so the sourcing made
# in .gitconfig does not fail
echo 'Adding .gitconfig.prepend bare conf file' \
&& touch ~/.gitconfig.prepend > /dev/null 2>&1

echo 'Adding .gitconfig' \
&& rm -f ~/.gitconfig > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/git/.gitconfig ~/.gitconfig

echo 'Adding .gitignore' \
&& rm -f ~/.gitignore > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/git/.gitignore ~/.gitignore
