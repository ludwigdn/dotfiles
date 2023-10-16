-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local keymap = vim.keymap

vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- General keymaps
-- ---------------

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<Leader>-", "<C-W>s")
keymap.set("n", "<Leader>|", "<C-W>v")

-- don't yank deleted chars
keymap.set("n", "x", '"_x')

-- Increment / decrement
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Move to previous/next tab
keymap.set("n", "<leader>h", ":tabp<CR>")
keymap.set("n", "<leader>l", ":tabn<CR>")

-- Quickfixlist shortcuts
keymap.set("n", "<leader>co", ":copen<CR>")
keymap.set("n", "<leader>cc", ":ccl<CR>")
keymap.set("n", "<leader>cn", ":cn<cr>")
keymap.set("n", "<leader>cp", ":cp<cr>")

-- Yank current word / paste on current word
keymap.set("n", "<leader>y", "viwy")
keymap.set("n", "<leader>p", "viwpviwy")

-- Replace current line with yanked stuff, and yank it again
keymap.set("n", "<leader>ap", "<s-v>pyy")

-- Auto resize windows
keymap.set("n", "<leader>=", "<C-w>=")

-- Clean search highlight
keymap.set("n", "z/", ":nohlsearch<CR>")

-- List current errors
keymap.set("n", "<leader>ce", ":lua vim.diagnostic.setqflist()<CR>")

-- Plugins keymaps
-- ---------------

-- Shortcut to Git Browse
keymap.set("n", "<leader>gb", ":GBrowse<CR>")
keymap.set("v", "<leader>gb", ":GBrowse<CR>")

-- Nvim-tree
keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
