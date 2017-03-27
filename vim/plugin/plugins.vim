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


Plugin 'tpope/vim-fugitive'             " Use git inside vi
Plugin 'tpope/vim-surround'             " Easily add characters arround stuff
Plugin 'tpope/vim-repeat'               " Enable . command with vim-surround
Plugin 'vim-airline/vim-airline'        " Making vi fancy
Plugin 'vim-airline/vim-airline-themes' " ... more themes
Plugin 'ntpeters/vim-better-whitespace' " Hilight whitespace
Plugin 'vim-scripts/tComment'           " Powerful comment shortcuts

Plugin 'vim-scripts/SearchComplete'     " Autocomplete while searching
Plugin 'ervandew/supertab'              " Autocomplete when using tab

Plugin 'xuhdev/vim-latex-live-preview'  " Make it easier to write latex
Plugin 'christoomey/vim-tmux-navigator' " Navigate using ctrl+[hjkl]

Plugin 'scrooloose/syntastic'                       " Syntax parser
let g:syntastic_sh_checkers = ['shellcheck']        " ... Set shell parser
let g:syntastic_c_checkers  = ['checkpatch', 'gcc'] " ... Set C parsers

Plugin 'vivien/vim-linux-coding-style'  " Make it easy to follow kernel style
let g:linuxsty_patterns = [ "/usr/src/", $HOME.'/dev/linux/' ]

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1


filetype plugin indent on " required!

