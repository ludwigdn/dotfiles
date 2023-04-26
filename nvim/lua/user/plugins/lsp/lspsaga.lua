local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	finder = {
		max_height = 0.5, --percentage
		force_max_height = false,
		keys = {
			jump_to = "i",
			edit = { "o", "<CR>" },
			vsplit = "v",
			split = "s",
			tabe = "t",
			tabnew = "r",
			quit = { "q", "<ESC>" },
			close_in_preview = { "q", "<ESC>" },
		},
	},
})
