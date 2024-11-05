--[[
-- NOTE:
-- The plugin files always get sourced, regardless of the loaded value,
-- but at the top of each plugin there's a check for loaded and if this
-- is the case they return immediately.
]]
--

vim.cmd("language en_US")

for _, plugin in ipairs({
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor_mode_plugin",
	"fzf",
	"spellfile_plugin",
}) do
	vim.g["loaded_" .. plugin] = 1
end

require("user.plugins-setup")

require("user.core.colorscheme")
require("user.core.keymaps")
require("user.core.autocmds")
require("user.core.options")

require("user.plugins.comment")
require("user.plugins.nvim-tree")
require("user.plugins.lualine")
require("user.plugins.telescope")

require("user.plugins.nvim-cmp")
require("user.plugins.lsp.mason")
require("user.plugins.lsp.lspsaga")
require("user.plugins.lsp.lspconfig")
require("user.plugins.lsp.null-ls")

require("user.plugins.autopairs")
require("user.plugins.treesitter")

require("user.plugins.gitsigns")
