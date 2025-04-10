-- Trim trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Auto indent at save and return to last cursor position
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    -- Save current cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    -- Ident file(s)
    vim.cmd(":execute 'normal! ggVG='")
    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, pos)
  end
})

-- Auto wrap on markdown files
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  group = group,
  command = "setlocal wrap",
})
