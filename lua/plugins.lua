local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

  use { "nathom/filetype.nvim" } -- speed up filetype detection
  use { "machakann/vim-sandwich" } -- Surround objects with any character e.g. saiw|sdb|srb"
  use { "romainl/vim-qf" } -- Better work with quickfix
    use { "mbbill/undotree" } -- Undotree
    use {
        "goolord/alpha-nvim", -- Startup screen
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require "config.alpha"
        end,
    }

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})
	use("editorconfig/editorconfig-vim")
	use("honza/vim-snippets")
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	})
	use("justinmk/vim-sneak")
	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	-- use({ "yuki-yano/fzf-preview.vim", branch = "release/rpc" })
	use("junegunn/fzf.vim")
	-- use({ "neoclide/coc.nvim", branch = "release" })
	use("reedes/vim-wheel")
	-- use("ruanyl/vim-fixmyjs")
	-- use 'sheerun/vim-polyglot'
	use("styled-components/vim-styled-components")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-rhubarb")
	use("tpope/vim-sensible")
	use("tpope/vim-unimpaired")
	use("tpope/vim-vinegar")
	use("christoomey/vim-tmux-navigator")
	use("nvim-tree/nvim-web-devicons")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })

	use({ "williamboman/mason.nvim" })
	use("nanozuki/tabby.nvim")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("MunifTanjim/prettier.nvim")
  use { 'mhartington/formatter.nvim' }
	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	-- })
	use({ "rcarriga/nvim-notify", config = "vim.notify = require('notify')" })
  -- Lua
use {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig",
    }, -- Required

			{ "williamboman/mason.nvim" }, -- Optional
			{
				"williamboman/mason-lspconfig.nvim",
			}, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			{ "tzachar/cmp-tabnine", run = "./install.sh" },
			"folke/lua-dev.nvim",
			"RRethy/vim-illuminate",
			"jose-elias-alvarez/null-ls.nvim",
			{
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup({})
				end,
			},

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"romgrk/fzy-lua-native",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"xiyaowong/telescope-emoji.nvim",
		},
		cmd = "Telescope",
		module = "telescope",
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({ "MaximilianLloyd/adjacent.nvim", requires = { "lewis6991/impatient.nvim" } })

	-- use({ "vimwiki/vimwiki" })
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ "ellisonleao/dotenv.nvim" })
	-- use("asiryk/auto-hlsearch.nvim")
	use({
		"lewis6991/spaceless.nvim",
		config = function()
			require("spaceless").setup()
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
