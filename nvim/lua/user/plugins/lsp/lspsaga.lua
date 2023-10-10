local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	definition = {
		max_height = 0.6, --percentage
		keys = {
			tabe = "t",
		},
	},
	finder = {
		max_height = 0.6, --percentage
		keys = {
			jump_to = "i",
			edit = { "o", "<CR>" },
			vsplit = "v",
			split = "s",
			tabe = "t",
			tabnew = "r",
			quit = "q",
			close_in_preview = "q",
		},
	},
})
