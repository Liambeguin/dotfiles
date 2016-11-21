" vim:set ft=vim cc=80:
"
" Here are all the Vundle specific configurations
" and all my plugins
"
set nocompatible " be iMproved
filetype off     " required!

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/vundle'


Plugin 'tpope/vim-fugitive'             " use git inside vi
Plugin 'tpope/vim-surround'             " Easily add characters arround stuff
Plugin 'tpope/vim-repeat'               " Enable . command with vim-surround
Plugin 'vim-airline/vim-airline'        " making vi fancy
Plugin 'ntpeters/vim-better-whitespace' " Hilight whitespace
Plugin 'vim-scripts/tComment'           " powerful comment shortcuts

Plugin 'vim-scripts/SearchComplete'     " Autocomplete while searching
Plugin 'ervandew/supertab'              " Autocomplete when using tab

Plugin 'xuhdev/vim-latex-live-preview'  " Make it easier to write latex
Plugin 'christoomey/vim-tmux-navigator' " Navigate using ctrl+[hjkl]

Plugin 'scrooloose/syntastic'                " Syntax parser
let g:syntastic_sh_checkers = ['shellcheck'] " ... Set specific shell parser


filetype plugin indent on " required!

