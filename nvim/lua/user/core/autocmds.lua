
-- Trim trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Run prettier whe saving a file
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*.{js,jsx,ts,tsx,vue,html,json,css,scss,md,yaml}" },
--   command = [[:Prettier]],
-- })

