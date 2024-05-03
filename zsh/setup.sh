export CODE_HOME="$HOME/code"

# Only adding this empty file so the sourcing made
# in .zshrc does not fail
echo 'Adding zsh prepend bare conf file' \
&& touch ~/.zshrc.prepend > /dev/null 2>&1

echo 'Adding zsh conf' \
&& rm -f ~/.zshrc > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/zsh/.zshrc ~/.zshrc

echo 'Adding p10k conf' \
&& rm -f ~/.p10k.zsh > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
