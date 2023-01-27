set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua require('impatient')
lua require('plugins')
source ~/.config/nvim/vimrc
