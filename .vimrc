
" Autoinstall PLUG if not installed --------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins ----------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
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

" Use filetype detection and file-based automatic indenting
filetype plugin indent on
" This whole stuff convert tabs to 4 spaces instead
  set tabstop=4
  set shiftwidth=4
  set expandtab

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
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    " Start NERDTree when Vim starts with a file argument.
    autocmd VimEnter * if argc() > 0 || exists("s:std_in") | NERDTree | wincmd p | endif
    " Start NERDTree when Vim starts with a directory argument.
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0]  | endif
    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " call function to auto-trim whitespaces at end of lines
    autocmd BufWritePre * :call TrimWhitespace()
    " This sets the file formats to unix, avoiding ^M errors when coming from dos
    autocmd BufWritePre * :set fileformat=unix
	" Auto source .vimrc file at saving
	autocmd BufWritePost .vimrc :so %
augroup END

" Remaps -----------------------------------------------------------------------------------------
let mapleader = ' '

" Inner terminal shortcut
map <leader>t :term<CR>

" Grep for visual-selected text in root folder
nnoremap <leader>g :execute "grep -r --exclude-dir=node_modules " . expand("<cword>") . " **" <Bar> cw<CR>

" NERDTree remaps
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nff :NERDTreeFind
nnoremap <leader>n :tabnew<CR>:NERDTree<CR>
" Rrefresh NERDTree
nnoremap <leader>r :NERDTreeFocus<cr>r<c-w><c-p>

" Switch between windows more easily
nnoremap <C-H> :wincmd h<CR>
nnoremap <C-J> :wincmd j<CR>
nnoremap <C-K> :wincmd k<CR>
nnoremap <C-L> :wincmd l<CR>

" Move to previous/next buffer
nnoremap <LEADER>j :bnext<CR>
nnoremap <LEADER>k :bprev<CR>

" Move to previous/next tab
nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR>

" Quickfixlist shortcuts
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :ccl<CR>
