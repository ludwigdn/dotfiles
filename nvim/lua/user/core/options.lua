local opt = vim.opt -- global access

-- Remove tildes (~) at the beginning of the lines
-- opt.fillchars = { eob = " " }

-- always display the signs column (diff, errors, etc.)
opt.signcolumn = "yes"

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false
opt.linebreak = true

-- width marker
opt.colorcolumn = "100"

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
opt.showmatch = true

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- colors
opt.termguicolors = true
opt.background = "light"

-- clipboard
opt.clipboard:append("unnamedplus")

-- Splitting panes
opt.splitbelow = true
opt.splitright = true

-- Allow deleting previously typed text
-- (Had the case with a Raspbian's version of vim)
opt.backspace = "indent,eol,start"

-- if a file is being edited by another program (or was written to file
-- while editing with another program), it is not allowed to be edited
opt.writebackup = false
