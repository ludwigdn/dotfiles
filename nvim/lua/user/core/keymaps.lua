-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local keymap = vim.keymap

vim.g.mapleader = " "

-- Modes
--   normal_mode =       "n"
--   insert_mode =       "i"
--   visual_mode =       "v"
--   visual_block_mode = "x"
--   term_mode =         "t"
--   command_mode =      "c"

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<Leader>-", "<C-W>s")
keymap.set("n", "<Leader>|", "<C-W>v")

-- Move easily within wrapped lines
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "j", "gj")
keymap.set("v", "k", "gk")
keymap.set("x", "j", "gj")
keymap.set("x", "k", "gk")

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

-- Spell checker
keymap.set("n", "s","")
keymap.set("n", "<leader>sg","zg")
keymap.set("n", "<leader>s<space>","z=")
keymap.set("n", "<leader>sb","zw")
