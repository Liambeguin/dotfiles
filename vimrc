"
" NOTE: http://marcgg.com/blog/2016/03/01/vimrc-example
" NOTE: https://github.com/sd65/MiniVim
" NOTE: Bitbake has a set of files that can be used goto bitbake/contrib/vim



""" NAVIGATION: http://vim.wikia.com/wiki/All_the_right_moves
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


" Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>



""" ABREVIATIONS
abbr Wq wq
abbr Q q
abbr W w



""" GENERAL SETTING
filetype off
syntax on
"let mapleader="," " default is to \
set clipboard=unnamed
set wildmenu " Better command-line completion
set updatetime=1000 " Save swap file to disk every 1000ms
let &showbreak="\u21aa " " Show a left arrow when wrapping text
set ttyfast " Set fast tty
set mouse=nv "Enabling mouse in Normal and Visual mode
set cursorline " Highlight cursor line
set showmatch  " When a bracket is inserted, briefly jump to the matching one
set matchtime=3 " ... during this time
" Search
set hlsearch  " Highlight found words
set incsearch " set incremental search, like modern browsers
" Tab control
"set noexpandtab " insert tabs rather than spaces for <Tab>
set expandtab " insert spaces rather than tabs for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set smartindent " Smart indent...
" Encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
" Case Sensitivity
set ignorecase
set smartcase



""" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=1000
au InsertEnter * set timeout
au InsertLeave * set notimeout




""" COMMANDS
" Delete all Whitespaces
command Nws execute "%s/\\s\\+$//g | nohl"
" Close buffer without removing split
command Bd bp\|bd \#




""" VIM-AIRLINE
execute 'runtime!' 'plugin/airline.vim'

""" VUNDLE
execute 'runtime!' 'plugin/plugins.vim'




""" CLOLORS
set background=light
highlight clear
highlight CursorLine  cterm=NONE ctermfg=NONE ctermbg=237
highlight Cursor      cterm=NONE ctermfg=235  ctermbg=231
highlight Visual      cterm=NONE ctermfg=NONE ctermbg=59
highlight ColorColumn cterm=NONE ctermfg=NONE ctermbg=237
" Search colors
highlight MatchParen  cterm=bold ctermfg=197  ctermbg=NONE
highlight IncSearch   cterm=bold ctermfg=235  ctermbg=186
highlight Search      cterm=bold ctermfg=235  ctermbg=186
" Split
highlight VertSplit   cterm=NONE ctermfg=241  ctermbg=241
""" vimdiff colors
highlight DiffAdd     cterm=bold ctermfg=46		ctermbg=17
highlight DiffDelete  cterm=bold ctermfg=Gray	ctermbg=17
highlight DiffChange  cterm=bold ctermfg=Gray 	ctermbg=17
highlight DiffText    cterm=bold ctermfg=White	ctermbg=124



" vim: set cc=80:
