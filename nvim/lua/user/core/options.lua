local opt = vim.opt -- global access

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false

-- tabs and indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- folding
opt.foldmethod = "indent"
opt.foldlevel = 20
opt.foldclose = "all"

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- colors
opt.termguicolors = true
opt.background = "dark"
--opt.colorscheme = "gruvbox"

-- clipboard
opt.clipboard:append("unnamedplus")

-- Splitting panes
opt.splitbelow = true
opt.splitright = true

-- Allow deleting previously typed text
-- (Had the case with a Raspbian's version of vim)
opt.backspace = "indent,eol,start"
