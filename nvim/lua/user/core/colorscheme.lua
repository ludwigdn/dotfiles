--local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- local status, _ = pcall(vim.cmd, "colorscheme melange")
-- if not status then
-- 	print("Colorscheme not found")
-- 	return
-- end

local cmd = vim.cmd -- global access
cmd.colorscheme("melange")
