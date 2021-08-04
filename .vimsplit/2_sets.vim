set relativenumber
set nu
set nowrap
set linebreak
set exrc
set belloff=all
set guicursor=
set scrolloff=10
set nohlsearch
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set cmdheight=2
"set colorcolumn=82
set signcolumn=yes
let g:NERDTreeShowHidden=1

" Folding
set nofoldenable
set foldmethod=indent
set foldlevel=20
set foldclose=all

" Autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Use filetype detection and file-based automatic indenting
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Prevent freeze on large ts files because of syntax highlighting
" (source: https://jameschambers.co.uk/vim-typescript-slow)
syntax on
set re=0


" Colors -----------------------------------------------------------------------------------------
set t_Co=256
colorscheme gruvbox
set background=dark


" Status line ------------------------------------------------------------------------------------
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{(FugitiveStatusline())}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\


" Ale lintera-------------------------------------------------------------------------------------
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_save = 1
