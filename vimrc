set nocompatible              " be iMproved, required

filetype off                  " required

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-tabnine',
  \ 'coc-word',
  \ 'coc-yank',
  \ 'coc-jest',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-smartf',
  \ 'coc-fzf-preview',
  \ 'coc-browser',
  \ 'coc-jsref',
  \ 'coc-sumneko-lua',
  \ ]


syntax enable
filetype plugin on
set termguicolors
set ai				    " Turn on auto indentation
set autoindent
set bsdir=last			" Go to last folder when browsing
set expandtab
set expandtab		            " Exapnd tabs to spaces
set hidden
set history=100			" Keep X commands in history
set hlsearch			" Highlight search results
set incsearch			" Turn on incremental searching
set nobk			    " Don't create backup files
set number
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set ru				    " Turn on the ruler
set sc				    " Show commands
set shiftwidth  =2
set si				    " Turn on smart indent
set smarttab		            " Turn on smart tabs
set so=7
set softtabstop =2
set splitbelow
set splitright
set t_Co=256
set tabstop     =2
syn on				    " Turn on syntax highlighting
" Backup
set noswapfile
" set backup backupdir=~/.vim/backup/
" set undofile undodir=~/.vim/backup/undo/
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set backspace=indent,eol,start	" Allow backspace in insert mode
set background=dark
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
let g:coc_node_path = '/Users/nickprokesch/.nvm/versions/node/v16.8.0/bin/node'
let g:node_host_prog = '/Users/nickprokesch/.nvm/versions/node/v16.8.0/bin/node'

let mapleader = "\<Space>"

" colorscheme solarized8
" colorscheme aurora
colorscheme catppuccin-frappe " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup filetype
au!
au! BufRead,BufNewFile *.eslintrc  set filetype=json
augroup END

au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  " autocmd FileType json set foldmethod=syntax
augroup END

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

map <F7> gg=G<C-o><C-o>
" vnoremap <leader>G "hy:Ag "<C-r>h"<CR>
nnoremap <leader>G :exe 'Rg!' expand('<cword>')<cr>

:command Thtml :%!tidy -q -i --show-errors 0
:command Txml  :%!tidy -q -i --show-errors 0 -xml

" nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" make test commands execute using dispatch.vim
let g:colorizer_auto_color = 1
let g:import_sort_auto = 1
let g:jsx_ext_required = 0
let g:xml_syntax_folding = 0
let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test|Test))\.(js|jsx|coffee|ts|tsx)$'

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
nnoremap <leader>jf :call  CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

" Run jest for current test
nnoremap <leader>je :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

:command WQ wq
:command Wq wq
:command W w
:command Q q


xmap ga <Plug>(coc-codeaction-selected)



if exists('+macmeta')
  setglobal macmeta
endif
setglobal winaltkeys=no

nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
nnoremap <silent> <C-w>Q :tabclose<CR>
nnoremap <silent> <C-w>. :if exists(':Wcd')<Bar>exe 'Wcd'<Bar>elseif exists(':Lcd')<Bar>exe 'Lcd'<Bar>elseif exists(':Glcd')<Bar>exe 'Glcd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
nmap cd <C-W>.

setglobal grepformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f\ \ %l%m
if executable('rg')
  setglobal grepprg=rg\ -s\ --vimgrep
elseif has('unix')
  setglobal grepprg=grep\ -rn\ $*\ /dev/null
endif

autocmd FileType tmux let b:dispatch = 'tmux source %:p:S'
autocmd FileType mail,gitcommit setlocal tw=72
autocmd FileType sh,zsh,csh,tcsh setlocal fo-=t|
      \ inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
autocmd FileType help setlocal ai formatoptions+=2n
autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak keywordprg=dict
autocmd FileType vim setlocal keywordprg=:help foldmethod=expr|
      \ setlocal foldexpr=getline(v:lnum)=~'^\"\ Section:'?'>1':'='
autocmd FileType json set sw=2 et


" " Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

  " Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

nnoremap <silent> <space>c  :<C-u>CocList commands<cr> " Show commands
nnoremap <silent> <space>j  :<C-u>CocNext<CR> " Do default action for next item.
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nmap <leader>p :GFiles<CR>
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W
noremap <C-P> :CocCommand fzf-preview.GitFiles<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>f :CocCommand fzf-preview.ProjectMruFiles<CR>
noremap <leader>u :PackerUpdate<CR>
noremap <leader>v :so ~/.vimrc<CR>
noremap <leader>w :w<CR>
noremap <leader>a :Gwrite<CR>
noremap <leader>s :Snippets<CR>
" noremap <leader>g :CocCommand fzf-preview.ProjectGrep
"
" " press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

" append result on current expression
nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)


let g:colorscheme_switcher_keep_background = 0

let g:ale_fixers = ['prettier_eslint', 'importjs', 'stylelint', 'fixjson']
" let g:ale_linters = {
" \   'javascript': ['stylelint', 'prettier_eslint'],
" \}
let g:ale_linters = {'jsx': ['stylelint', 'prettier_eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 0
let g:import_sort_auto = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
" let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let $FZF_DEFAULT_COMMAND = 'rg -g "" --glob "!public" --glob "!*.json"'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END



function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
" autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
