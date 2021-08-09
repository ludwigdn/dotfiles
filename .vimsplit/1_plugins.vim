call plug#begin('~/.vim/plugged')

  " Color
  Plug 'gruvbox-community/gruvbox'

  " Tree visualization
  Plug 'preservim/nerdtree'

  " Plugins for languages detection
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Git related
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  " Syntax highlighting and linting icons
  "Plug 'dense-analysis/ale'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

" Search through files / content
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

call plug#end()


" --------------------
" Plugins dependencies
" --------------------
" - Silver Searcher (https://github.com/ggreer/the_silver_searcher#installing)
" - Ripgrep (https://github.com/BurntSushi/ripgrep#installation)

" --------------
" coc extensions - https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" --------------
" :CocInstall coc-json coc-tsserver coc-html coc-css
" :CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-omnisharp
