let mapleader = "\<space>"

" Shortcut to Git Browse
map <leader>gb :GBrowse<CR>

" Reveal current file in NERDTree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Switch between windows more easily
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Move to previous/next buffer
nnoremap <leader>j :bnext<CR>:NERDTreeFind<CR><c-w><c-p>
nnoremap <leader>k :bprev<CR>:NERDTreeFind<CR><c-w><c-p>

" Move to previous/next tab
nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR>

" Quickfixlist shortcuts
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :ccl<CR>
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>

"Comment code with //
nnoremap <leader>cm 0wi//<ESC>

" Use the system clipboard instead of vim register
set clipboard+=unnamedplus

" Yank current word / paste on current word
nnoremap <leader>y viwy
nnoremap <leader>p viwpviwy

" Replace current line with yanked stuff, and yank it again
nnoremap <leader>ap <s-v>pyy

"Auto resize windows
nnoremap <silent> <leader>= <C-w>=

" Find files using FZF
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :Rg<CR>

"Maps to prevent unwanted actions when focus is on NERDTree
nnoremap <silent> <expr> <leader>ff (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <expr> <leader>fg (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
nnoremap <silent> <expr> <leader>j (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":bnext\<CR>:NERDTreeFind\<CR>\<c-w>\<c-p>"
nnoremap <silent> <expr> <leader>k (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":bprev\<CR>:NERDTreeFind\<CR>\<c-w>\<c-p>"
nnoremap <silent> <expr> ":q<cr>" (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":q\<cr>"
nnoremap <silent> <expr> ":wq<cr>" (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":wq\<cr>"
nnoremap <silent> <expr> ":wa<cr>" (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":wa\<cr>"

" Set background theme
nnoremap <leader>bl :set background=light<cr>
nnoremap <leader>bd :set background=dark<cr>
