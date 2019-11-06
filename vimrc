" vim: set cc=80:
"
" NOTE: http://marcgg.com/blog/2016/03/01/vimrc-example
" NOTE: https://github.com/sd65/MiniVim
" NOTE: Bitbake has a set of files that can be used goto bitbake/contrib/vim
" NOTE: this one is really good !
"       http://stevelosh.com/blog/2010/09/coming-home-to-vim/



" Navigation: http://vim.wikia.com/wiki/All_the_right_moves
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


" Fix most common typos
abbr Wq wq
abbr Q q
abbr W w


" General settings
syntax on                " Enable syntax highlighting
colorscheme lvbdark      " Use custom colorscheme
set mouse=a              " Enable mouse all the time
set scrolloff=7          " Set minimal number of lines above and below the cursor
set ruler                " Always show line and column of the cursor position
set cursorline           " Highlight cursor line
" set cursorcolumn         " Highlight cursor column
set clipboard=unnamedplus
set pastetoggle=<leader>p
set ttyfast              " Set fast tty
set ttymouse=xterm2      " Fix unable to resize window in tmux
let &showbreak="\u21aa " " Show a left arrow when wrapping text
set showmatch   " When a bracket is inserted, briefly jump to the matching one
set matchtime=3 " ... during this time
set guifont=Terminess\ Powerline\ 10

" Allow project specific vimrc files
set exrc
set secure

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Add leader to have more combinations
let mapleader='\' " default is to \
let g:mapleader='\'

" Auto complete
set wildmenu                 " Enalbing better command-line completion
set wildmode=longest,list    " Set command-line completion options
set completeopt=menu,longest " Set insert-mode completion options

" Swapfiles
set updatetime=1000    " Save swapfile to disk every 1000ms
set dir=~/.cache
set wildignore+=*.o,*.pyc


" Search
set hlsearch   " Highlight found words
set incsearch  " Set incremental search
set nowrapscan " Do not wrap arround

" Tab control
set noexpandtab   " insert tabs rather than spaces for <Tab>
" set expandtab   " insert spaces rather than tabs for <Tab>
set smarttab      " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=8     " the visible width of tabs
set softtabstop=8 " edit as if the tabs are 4 characters wide
set shiftwidth=8  " number of spaces to use for indent and unindent
set shiftround    " round indent to a multiple of 'shiftwidth'
set smartindent   " Smart indent...

" Encoding
set encoding=utf-8     " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file.

" Case Sensitivity
set ignorecase " Ignore case in search patterns
set smartcase  " override ignorecase if search pattern contains upper case chars

" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=1000
au InsertEnter * set timeout
au InsertLeave * set notimeout

" Custom commands
"  delete all eol whitespaces
command! Nws execute "%s/\\s\\+$//g | noh"

" include other files
execute 'runtime!' 'plugin/airline.vim'
execute 'runtime!' 'plugin/plugins.vim'
execute 'runtime!' 'plugin/remap.vim'

" file type specific options
autocmd FileType sh,bash setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType c,cpp,h setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd FileType py,python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType rst,yaml,meson     setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab cc=80 tw=80

autocmd FileType diff    setlocal ft=gitsendemail
autocmd BufRead *defconfig setlocal ft=config

