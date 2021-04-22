
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
  Plug 'preservim/nerdtree'
call plug#end()


" Set --------------------------------------------------------------------------------------------
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set relativenumber
set nu
set wrap
set linebreak
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
set cmdheight=2
" set colorcolumn=82
set signcolumn=yes


" Colors -----------------------------------------------------------------------------------------
colorscheme gruvbox
set background=dark


" Functions --------------------------------------------------------------------------------------
fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun


" Auto commands ---------------------------------------------------------------------------------
augroup MyCustomAutoGroup
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    " Start NERDTree when Vim starts with a file argument.
    autocmd VimEnter * if argc() > 0 || exists("s:std_in") | NERDTree | wincmd p | endif
    " Start NERDTree when Vim starts with a directory argument.
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0]  | endif
    " Exit Vim if NERDTree is the only window left.
    " TODO try tto update this with current window only
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " call function to auto-trim whitespaces at end of lines
    autocmd BufWritePre * :call TrimWhitespace()
    " This sets the file formats to unix, avoiding ^M errors when coming from dos
    autocmd BufWritePre * :set fileformat=unix
augroup END


" Remaps -----------------------------------------------------------------------------------------
let mapleader = ' '

" NERDTree remaps
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nff :NERDTreeFind<CR>
nnoremap <leader>nf :NERDTreeFind
" Open a new tab with NERDTree started
map <leader>n :tabnew<CR>:NERDTree<CR>
" Rrefresh NERDTree
nmap <leader>r :NERDTreeFocus<cr>r<c-w><c-p>

" Switch between windows more easily
nnoremap <leader>w <C-w>
" Move to left window
map <leader>h : wincmd h<CR>
" Move to left tab
map <leader>th :tabp<CR>
" Move to right window
map <leader>l :wincmd l<CR>
" Move to right tab
map <leader>tl :tabn<CR>
