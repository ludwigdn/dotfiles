" Autoinstall PLUG if not installed --------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source '~/.vimrc'
endif

source ~/.vimsplit/1_plugins.vim
source ~/.vimsplit/2_sets.vim
source ~/.vimsplit/3_functions.vim
source ~/.vimsplit/4_autocmds.vim
source ~/.vimsplit/5_remaps.vim
source ~/.vimsplit/coc.vim
