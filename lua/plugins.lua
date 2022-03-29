local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'airblade/vim-gitgutter'
  use 'ap/vim-css-color'
  use 'chrisbra/Colorizer'
  use 'rafalbromirski/vim-aurora'
  use 'csscomb/vim-csscomb'
  use 'easymotion/vim-easymotion'
  use 'editorconfig/editorconfig-vim'
  use 'galooshi/vim-import-js'
  use 'haya14busa/incsearch-easymotion.vim'
  use 'haya14busa/incsearch-fuzzy.vim'
  use 'haya14busa/incsearch.vim'
  use 'honza/vim-snippets'
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'justinmk/vim-sneak'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {'yuki-yano/fzf-preview.vim', branch = 'release/rpc'}
  use 'junegunn/fzf.vim'
  use 'nathanaelkane/vim-indent-guides'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'rafi/awesome-vim-colorschemes'
  use 'reedes/vim-wheel'
  use 'reinh/vim-makegreen'
  use 'ruanyl/vim-fixmyjs'
  use 'sheerun/vim-polyglot'
  use 'styled-components/vim-styled-components'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-abolish' 
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-obsession'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'w0rp/ale'
  use 'xolox/vim-misc'
  use 'jgdavey/tslime.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'SirVer/ultisnips'
  use 'ryanoasis/vim-devicons'
  use 'lewis6991/impatient.nvim'
  use {
  'lewis6991/spaceless.nvim',
  config = function()
    require'spaceless'.setup()
  end
}
end)
