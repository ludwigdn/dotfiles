
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
" This whole stuff convert tabs to 2 spaces instead
  set tabstop=2
  set shiftwidth=2
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
let g:NERDTreeShowHidden=1


" Colors -----------------------------------------------------------------------------------------
set t_Co=256
colorscheme gruvbox
set background=dark


" Status line ------------------------------------------------------------------------------------
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)


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


" Highlight all instances of word under cursor, when idle ----------------------------------------
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=200
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=200
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction


" Remaps -----------------------------------------------------------------------------------------
let mapleader = "\<space>"

" Inner terminal shortcut
map <leader>t :term<CR>

" WIP: Grep for visual-selected text in root folder
" nnoremap <leader>g :execute \"grep -r --exclude-dir=node_modules \" . expand("<cword>") . \" **\" <Bar> cw<CR>

" NERDTree remaps
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nff :NERDTreeFind
nnoremap <leader>n :tabnew<CR>:NERDTree<CR>
" Rrefresh NERDTree
nmap <leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Switch between windows more easily
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Move to previous/next buffer
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>

" Move to previous/next tab
nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR>

" Quickfixlist shortcuts
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :ccl<CR>

" Yank current word / paste on current word
nnoremap <leader>y viwy
nnoremap <leader>p viwp
