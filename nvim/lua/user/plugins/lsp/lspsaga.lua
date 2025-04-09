local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

vim.keymap.set('n', '<leader>t', ':Lspsaga term_toggle<CR>')

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
