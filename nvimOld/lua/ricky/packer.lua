-- -- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
--
return require('packer').startup(function(use)
--
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
--
--   -- Catpuccin theme
--   use({
--       'catppuccin/nvim',
--       as = 'catppuccin',
--       config = function()
--           vim.cmd('colorscheme catppuccin')
--       end
--   })
--
--   -- Status line - lua line
--   use ('nvim-lualine/lualine.nvim')
--
--   -- Other plugins
--   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
--   use('nvim-treesitter/playground')
--   use('theprimeagen/harpoon')
--   use('mbbill/undotree')
--   use("github/copilot.vim")
--   use("terrortylor/nvim-comment")
--   use("christoomey/vim-tmux-navigator")
--
--   -- Git plugins
--   use('tpope/vim-fugitive')
--   use('lewis6991/gitsigns.nvim')
--
--   -- LSP-Zero
--   use {
-- 	  'VonHeikemen/lsp-zero.nvim',
-- 	  branch = 'v1.x',
-- 	  requires = {
-- 		  -- LSP Support
-- 		  {'neovim/nvim-lspconfig'},
-- 		  {'williamboman/mason.nvim'},
-- 		  {'williamboman/mason-lspconfig.nvim'},
--
-- 		  -- Autocompletion
-- 		  {'hrsh7th/nvim-cmp'},
-- 		  {'hrsh7th/cmp-buffer'},
-- 		  {'hrsh7th/cmp-path'},
-- 		  {'saadparwaiz1/cmp_luasnip'},
-- 		  {'hrsh7th/cmp-nvim-lsp'},
-- 		  {'hrsh7th/cmp-nvim-lua'},
--
-- 		  -- Snippets
-- 		  {'L3MON4D3/LuaSnip'},
-- 		  {'rafamadriz/friendly-snippets'},
-- 	  }
--   }
--
--   -- File explorer side panel
--   use {
--       'nvim-tree/nvim-tree.lua',
--       requires = {
--           'nvim-tree/nvim-web-devicons', -- optional
--       },
--   }
--
--   -- remote ssh
--   use {
--       'nosduco/remote-sshfs.nvim',
--       requires = { {'nvim-telescope/telescope.nvim'} } -- optional if you declare plugin somewhere else
--   }
--
end)
