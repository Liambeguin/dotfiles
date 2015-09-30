
" ==  General Stuff  ==========================================================
" Navigation
"  for more go to : http://vim.wikia.com/wiki/All_the_right_moves
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Abreviations
abbr Wq wq
abbr Q q
abbr W w

set hlsearch
set incsearch " set incremental search, like modern browsers

set clipboard=unnamed

" rhanging autocomplete in command mode
" so it displays options
set wildmode=longest,list

" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Case Sensitivity
set ignorecase
set smartcase
set bg=light

filetype off
syntax on

" Delete all Whitespaces
command Nws execute "%s/\\s\\+$//g | nohl"
" Close buffer without removing split
command Bd bp\|bd \#

" Bitbake has a set of files that can be used goto bitbake/contrib/vim
" =============================================================================




" == Vim-airline ==============================================================
"
execute 'runtime!' 'plugin/vimrc-airline'
" =============================================================================




" == Vundle ===================================================================
"
execute 'runtime!' 'plugin/vim.plugins'
" =============================================================================




" == local stuff ==============================================================
"
execute 'runtime!' 'vim.local'
" =============================================================================




" == Vimdiff colors ===========================================================
"
highlight DiffAdd    cterm=bold ctermfg=46		ctermbg=17
highlight DiffDelete cterm=bold ctermfg=Gray	ctermbg=17
highlight DiffChange cterm=bold ctermfg=Gray 	ctermbg=17
highlight DiffText   cterm=bold ctermfg=White	ctermbg=124
" =============================================================================
