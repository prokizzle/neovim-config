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
	-- LSP support
	--   use({
	--     "glepnir/lspsaga.nvim",
	--     branch = "main",
	--     config = function()
	--         local saga = require("lspsaga")
	--
	--         saga.init_lsp_saga({
	--             -- your configuration
	--         })
	--     end,
	-- })
	--   use {
	--     'VonHeikemen/lsp-zero.nvim',
	--     requires = {
	--       -- LSP Support
	--       {'neovim/nvim-lspconfig'},
	--       {'williamboman/mason.nvim'},
	--       {'williamboman/mason-lspconfig.nvim'},
	--
	--       -- Autocompletion
	--       {'hrsh7th/nvim-cmp'},
	--       {'hrsh7th/cmp-buffer'},
	--       {'hrsh7th/cmp-path'},
	--       {'saadparwaiz1/cmp_luasnip'},
	--       {'hrsh7th/cmp-nvim-lsp'},
	--       {'hrsh7th/cmp-nvim-lua'},
	--       {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'},
	--
	--
	--       -- Snippets
	--       {'L3MON4D3/LuaSnip'},
	--       {'rafamadriz/friendly-snippets'},
	--     }
	--   }

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("airblade/vim-gitgutter")
	use("ap/vim-css-color")
	use("chrisbra/Colorizer")
	use("csscomb/vim-csscomb")
	use("easymotion/vim-easymotion")
	use("editorconfig/editorconfig-vim")
	use("galooshi/vim-import-js")
	use("haya14busa/incsearch-easymotion.vim")
	use("haya14busa/incsearch-fuzzy.vim")
	use("haya14busa/incsearch.vim")
	use("honza/vim-snippets")
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	})
	use("jeffkreeftmeijer/vim-numbertoggle")
	use("justinmk/vim-sneak")
	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	use({ "yuki-yano/fzf-preview.vim", branch = "release/rpc" })
	use("junegunn/fzf.vim")
	use("nathanaelkane/vim-indent-guides")
	use({ "neoclide/coc.nvim", branch = "release" })
	use("reedes/vim-wheel")
	use("reinh/vim-makegreen")
	use("ruanyl/vim-fixmyjs")
	-- use 'sheerun/vim-polyglot'
	use("styled-components/vim-styled-components")
	use("tomtom/tcomment_vim")
	use("tpope/vim-abolish")
	use("tpope/vim-dispatch")
	use("tpope/vim-eunuch")
	use("tpope/vim-fugitive")
	use("tpope/vim-obsession")
	use("tpope/vim-repeat")
	use("tpope/vim-rhubarb")
	use("tpope/vim-sensible")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("tpope/vim-vinegar")
	use("w0rp/ale")
	use("xolox/vim-misc")
	use("jgdavey/tslime.vim")
	use("christoomey/vim-tmux-navigator")
	use("SirVer/ultisnips")
	use("nvim-tree/nvim-web-devicons")
	use("lewis6991/impatient.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })
	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	-- })
	use({ "rcarriga/nvim-notify", config = "vim.notify = require('notify')" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"romgrk/fzy-lua-native",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
		},
		cmd = "Telescope",
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
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})

	use({
		"LukasPietzschmann/telescope-tabs",
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope-tabs").setup({
				-- Your custom config :^)
			})
		end,
	})

	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "MaximilianLloyd/adjacent.nvim" })
	use({ "fannheyward/telescope-coc.nvim" })

	use({ "xiyaowong/telescope-emoji.nvim" })

	use({ "vimwiki/vimwiki" })
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
	use("asiryk/auto-hlsearch.nvim")
	use({
		"lewis6991/spaceless.nvim",
		config = function()
			require("spaceless").setup()
		end,
	})
--   use({
--     'rose-pine/neovim',
--     as = 'rose-pine',
--     config = function()
--         require("rose-pine").setup()
--         vim.cmd('colorscheme rose-pine')
--     end
-- })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
