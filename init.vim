lua require('utils')
lua require('setNodePath')
lua require('impatient')
lua require('plugins')
source ~/.config/nvim/vimrc

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
