local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({

	-- enable syntax highlighting
	highlight = {
		enable = true,
	},

	-- enable indentation
	indent = { enable = true },

	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },

	-- ensure these language parsers are installed
	ensure_installed = {
		"html",
		"css",
		"scss",
		"javascript",
		"tsx",
		"vue",

		"bash",

		"json",
		"markdown",
		"markdown_inline",
		"mermaid",
		"dockerfile",
		"yaml",

		"lua",
		"vim",
	},

	-- auto install above language parsers
	auto_install = true,
})
