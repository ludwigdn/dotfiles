-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)

  -- Core plugins
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")
  use("tpope/vim-surround")
  use("christoomey/vim-tmux-navigator")
  use("numToStr/Comment.nvim")
  --use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- colorscheme
  use("gruvbox-community/gruvbox")
  --use "RRethy/nvim-base16" -- A bunch of color schemes based on base 16
  --use "LunarVim/Colorschemes" -- LunarVim specific color schemes
  --use "rafi/awesome-vim-colorschemes"
  -- use "luisiacc/gruvbox-baby"

  -- which-key
  --use "folke/which-key.nvim"

  -- nvim-tree
  use("nvim-tree/nvim-tree.lua")

  -- Icons
  --use("kyazdani42/nvim-web-devicons")
  use("nvim-tree/nvim-web-devicons")

  -- telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope.nvim")
  --use "folke/trouble.nvim"

  -- git
  --use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- indentline
  --use "lukas-reineke/indent-blankline.nvim"

  -- colorizer
  --use "norcalli/nvim-colorizer.lua"

  -- formatter
  --use "mhartington/formatter.nvim"

  -- treesitter
  --use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- lsp
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  -- use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  --use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  --use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  -- tab
  --use "alvarosevilla95/luatab.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

