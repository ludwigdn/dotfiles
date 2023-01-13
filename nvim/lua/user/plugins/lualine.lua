local setup, lualine = pcall(require, "lualine")
if not setup then
	return
end

lualine.setup({
	sections = {
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "filetype" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
