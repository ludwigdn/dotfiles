local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	return
end

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspAutoFormatting", {})

-- configure null_ls
null_ls.setup({
	sources = {
		completion.spell,
		formatting.stylua,
		formatting.prettier.with({
			condition = function(utils)
				return utils.root_has_file({ ".prettierrc" })
			end,
		}),
		require("none-ls.diagnostics.eslint_d").with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs" })
			end,
		}),
	},

	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
