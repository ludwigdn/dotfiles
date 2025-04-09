local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local navic_setup, navic = pcall(require, "nvim-navic")
if not navic_setup then
  return
end

navic.setup({
  icons = {},
  highlight = true,
})


-- Lspsaga show_[...]_diagnostics now only works if severity_sort is truthty
-- https://github.com/nvimdev/lspsaga.nvim/issues/1520
vim.diagnostic.config({
  severity_sort = true,
})

-- Hover documentation
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- set keybinds
vim.keymap.set("n", "<leader>fa", ":Lspsaga code_action<CR>")
vim.keymap.set("n", "gf", ":Lspsaga finder<CR>") -- show definition, references
vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>") -- got to declaration
vim.keymap.set("n", "gd", ":Lspsaga peek_definition<CR>") -- see definition and make edits in window
vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>") -- go to implementation
vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>") -- see available code actions
vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>") -- smart rename
vim.keymap.set("n", "<leader>D", ":Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
vim.keymap.set("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
vim.keymap.set("n", "<leader>o", ":LSoutlineToggle<CR>") -- see outline on right hand side

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
lspconfig.ts_ls.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "javascript", "typescript" },
  },
})

-- configure vue server
lspconfig["volar"].setup({
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- configure omnisharp server
lspconfig["omnisharp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
