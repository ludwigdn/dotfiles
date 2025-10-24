export CODE_HOME="$HOME/code"

mkdir ~/.config > /dev/null 2>&1
mkdir ~/.config/nvim > /dev/null 2>&1

echo 'Adding init.lua' \
&& rm -f ~/.config/nvim/init.lua > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

echo 'Adding lua folder' \
&& rm -rf ~/.config/nvim/lua > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotfiles/nvim/lua ~/.config/nvim/lua

echo 'Adding spell folder' \
&& cp -R $CODE_HOME/dotfiles/nvim/spell/ ~/.config/nvim/spell/
