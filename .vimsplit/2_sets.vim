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
"set undodir=~/.vim/undodir
"set undofile
set incsearch
set hlsearch
set cmdheight=2
"set colorcolumn=82
set signcolumn=yes
let g:NERDTreeShowHidden=1

" Allow deleting preivously typed text
" (Had the case with my Raspbian's version of vim)
set backspace=indent,eol,start

" Splitting panes
set splitbelow
set splitright

" Folding
set nofoldenable
set foldmethod=indent
set foldlevel=20
set foldclose=all
let g:NERDTreeIgnore = ['^node_modules$','^build$', '^dist$', '^.circleci$', '^.git$', '^.github$', '^.vscode$', '^.worktrees$', '^obj$', '^bin$']

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
set termguicolors
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

" Prettier ---------------------------------------------------------------------------------------
let g:prettier#config#trailing_comma = 'none'

" Ale linters -------------------------------------------------------------------------------------
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_save = 1
