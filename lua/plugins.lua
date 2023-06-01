local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
augroup packer_r_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | Lazy sync
augroup end
]])
plugins = {
	{ "neoclide/coc.nvim", branch = "release" },
	{ "ckipp01/stylua-nvim", build = "cargo install stylua" },

	{ "nathom/filetype.nvim" }, -- speed up filetype detection
	{ "machakann/vim-sandwich" }, -- Surround objects with any character e.g. saiw|sdb|srb"
	{ "romainl/vim-qf" }, -- Better work with quickfix
	{ "mbbill/undotree" }, -- Undotree
	{
		"goolord/alpha-nvim", -- Startup screen
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.alpha")
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "editorconfig/editorconfig-vim" },
	{ "honza/vim-snippets" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	{ "justinmk/vim-sneak" },
	{ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
	-- ({ "yuki-yano/fzf-preview.vim", branch = "release/rpc" },)
	{ "junegunn/fzf.vim" },
	-- ({ "neoclide/coc.nvim", branch = "release" },)
	{ "reedes/vim-wheel" },
	-- ("ruanyl/vim-fixmyjs")
	--  'sheerun/vim-polyglot'
	{ "styled-components/vim-styled-components" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-sensible" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-vinegar" },
	{ "christoomey/vim-tmux-navigator" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{ "ckipp01/stylua-nvim", run = "cargo install stylua" },

	{ "williamboman/mason.nvim" },
	{ "nanozuki/tabby.nvim" },

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "mhartington/formatter.nvim" },
	{ "rcarriga/nvim-notify", config = "vim.notify = require('notify')" },
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
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
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{ "MaximilianLloyd/adjacent.nvim", dependencies = { "lewis6991/impatient.nvim" } },

	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{ "ellisonleao/dotenv.nvim" },
	-- ("asiryk/auto-hlsearch.nvim")
	{
		"lewis6991/spaceless.nvim",
		config = function()
			require("spaceless").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to  defaults
			})
		end,
	},
}

require("lazy").setup(plugins, opts)
