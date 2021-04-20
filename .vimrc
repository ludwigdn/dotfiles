
" Autoinstall PLUG if not installed --------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins ----------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()


" Set --------------------------------------------------------------------------------------------
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set relativenumber
set nu
set nowrap
set exrc
set belloff=all
set guicursor=
set scrolloff=10
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=100
set signcolumn=yes
set cmdheight=2


" Colors -----------------------------------------------------------------------------------------
:colorscheme gruvbox
:set background=dark


" Functions --------------------------------------------------------------------------------------
fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun


" Auto commands ---------------------------------------------------------------------------------
augroup MyCustomAutoGroup
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()
    " This sets the file formats to unix, avoiding ^M errors when coming from dos
	autocmd BufWritePre * :set fileformat=unix
augroup END


" Remaps -----------------------------------------------------------------------------------------

