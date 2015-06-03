" ==  General Stuff  ==========================================================
" Navigation
"  for more go to : http://vim.wikia.com/wiki/All_the_right_moves
nmap <Backspace> <PageUp>
nmap <Space> <PageDown>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Abreviations
abbr Wq wq
abbr Q q

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

filetype off
syntax on

" Delete all Whitespaces
command Nws execute "%s/\\s\\+$//g | nohl"
" Close buffer without removing split
command Bd bp\|bd \#

" Mapping c in visual line  mode to comment
autocmd FileType c  xmap c I// 
autocmd FileType sh xmap c I# 
" =============================================================================



" == Vim-airline ==============================================================
"
" nice themes:
"    * ubaryd no replace theme
"    * badwolf no replace theme
"    * hybridline

set laststatus=2 " Always show status line
set noshowmode   " get rid of the second status line

let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#show_message = 1
" Git section
let g:airline#extensions#hunks#enabled=1
" powerline sections
 let g:airline_section_y = ''
" =============================================================================




" == Vundle ===================================================================
"
set nocompatible " be iMproved
filetype off " required!

" Vundle setup
" required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" TODO: On first install this'll have TBD manually
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'junegunn/vim-easy-align'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/SearchComplete'
" Bundle 'xuhdev/vim-latex-live-preview'
Bundle 'scrooloose/syntastic'

filetype plugin indent on " required!
" =============================================================================



" == Vimdiff colors ===========================================================
"
highlight DiffAdd    cterm=bold ctermfg=46		ctermbg=17
highlight DiffDelete cterm=bold ctermfg=Gray	ctermbg=17
highlight DiffChange cterm=bold ctermfg=Gray 	ctermbg=17
highlight DiffText   cterm=bold ctermfg=White	ctermbg=124
" =============================================================================


