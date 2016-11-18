"
" NOTE: http://marcgg.com/blog/2016/03/01/vimrc-example
" NOTE: https://github.com/sd65/MiniVim
" NOTE: Bitbake has a set of files that can be used goto bitbake/contrib/vim
" NOTE: this one is really good !
"       http://stevelosh.com/blog/2010/09/coming-home-to-vim/



""" NAVIGATION: http://vim.wikia.com/wiki/All_the_right_moves
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


" Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
" Treat long lines as break lines
map j gj
map k gk
" Quick Esc
inoremap jj <Esc>



""" ABREVIATIONS
abbr Wq wq
abbr Q q
abbr W w


""" ALLOW PROJECT SPECIFIC VIMRC FILES
set exrc
set secure

""" GENERAL SETTING
filetype off
syntax on
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" add leader to have more combinations
let mapleader='\' " default is to \
let g:mapleader='\'
set so=7 " set 7 lines to the cursor up-down
set ruler " always show current position
set clipboard=unnamed
set wildmenu " Better command-line completion
set updatetime=1000 " Save swap file to disk every 1000ms
let &showbreak="\u21aa " " Show a left arrow when wrapping text
set ttyfast " Set fast tty
set mouse=a " Enable mouse all the time1
set ttymouse=xterm2 " Fix unable to resize window in tmux
set cursorline " Highlight cursor line
set showmatch  " When a bracket is inserted, briefly jump to the matching one
set matchtime=3 " ... during this time
" Search
set hlsearch  " Highlight found words
set incsearch " set incremental search, like modern browsers
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
" set expandtab " insert spaces rather than tabs for <Tab>
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


""" Save on losing focus
" au FocusLost * :wa


""" COMMANDS
" Delete all Whitespaces
command Nws execute "%s/\\s\\+$//g | nohl"
" Close buffer without removing split
command Bd bp\|bd \#


""" LEADER SHORTCUTS
" Insert at the begining
nnoremap <leader>i ggI


""" VIM-AIRLINE
execute 'runtime!' 'plugin/airline.vim'

""" VUNDLE
execute 'runtime!' 'plugin/plugins.vim'



set guifont=Terminess\ Powerline\ 9

""" CLOLORS
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
set background=light
highlight clear
highlight Normal                                             gui=NONE guifg=#ffffff guibg=#000000
highlight CursorLine  cterm=NONE ctermfg=NONE  ctermbg=237   gui=NONE guifg=NONE    guibg=#3a3a3a
highlight Cursor      cterm=NONE ctermfg=235   ctermbg=231   gui=NONE guifg=#262626 guibg=#ffffff
highlight Visual      cterm=NONE ctermfg=NONE  ctermbg=59    gui=NONE guifg=NONE    guibg=#5f5f5f
highlight ColorColumn cterm=NONE ctermfg=NONE  ctermbg=237   gui=NONE guifg=NONE    guibg=#3a3a3a
" Search colors
highlight MatchParen  cterm=bold ctermfg=NONE ctermbg=186    gui=NONE guifg=NONE    guibg=#d7d787
highlight IncSearch   cterm=bold ctermfg=235  ctermbg=186    gui=NONE guifg=#262626 guibg=#d7d787
highlight Search      cterm=bold ctermfg=235  ctermbg=186    gui=NONE guifg=#262626 guibg=#d7d787
" Split
highlight VertSplit   cterm=NONE ctermfg=241  ctermbg=241    gui=NONE guifg=#626262 guibg=#626262
" vimdiff colors
highlight DiffAdd     cterm=bold ctermfg=46     ctermbg=17   gui=NONE guifg=#00ff00 guibg=#00005f
highlight DiffDelete  cterm=bold ctermfg=Gray	ctermbg=17   gui=NONE guifg=#87ffff guibg=#00005f
highlight DiffChange  cterm=bold ctermfg=Gray 	ctermbg=17   gui=NONE guifg=#87ffff guibg=#00005f
highlight DiffText    cterm=bold ctermfg=White	ctermbg=124  gui=NONE guifg=#ffffff guibg=#af0000




" vim: set cc=80:
