local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

-- set keybinds
vim.keymap.set('n', '<leader>t', ':Lspsaga term_toggle<CR>')
vim.keymap.set("n", "<leader>fa", ":Lspsaga code_action<CR>")
vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>") -- see available code actions
vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>") -- smart rename
vim.keymap.set("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
vim.keymap.set("n", "<leader>D", ":Lspsaga show_buf_diagnostics<CR>") -- show diagnostics for buffer
vim.keymap.set("n", "gf", ":Lspsaga finder<CR>") -- show definition, references
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>") -- go to definition
vim.keymap.set("n", "gp", ":Lspsaga peek_definition<CR>") -- see definition and make edits in window
vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer

saga.setup({
  definition = {
    max_height = 0.8, --percentage
    keys = {
      tabe = "t",
    },
  },
  finder = {
    max_height = 0.8, --percentage
    keys = {
      edit = { "o", "<CR>" },
      vsplit = "v",
      split = "s",
      tabe = "t",
      quit = "q",
    },
  },
})
