# .vimrc -------------------------------
echo 'Adding .vimrc' \
&& rm ~/.vimrc > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotvim/.vimrc ~/.vimrc

# splitted vim files -------------------
echo 'Adding vimsplit folder' \
&& rm ~/.vimsplit > /dev/null 2>&1 \
&& ln -s $CODE_HOME/dotvim/.vimsplit ~/.vimsplit
