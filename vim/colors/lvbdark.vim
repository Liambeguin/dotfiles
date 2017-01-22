
"
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim


set background=light

highlight clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "lvbdark"

highlight Normal           cterm=NONE ctermfg=NONE  ctermbg=NONE  gui=NONE guifg=#ffffff guibg=#000000
highlight NonText          cterm=bold ctermfg=12    ctermbg=NONE  gui=bold guifg=Blue    guibg=NONE
highlight CursorLine       cterm=NONE ctermfg=NONE  ctermbg=234   gui=NONE guifg=NONE    guibg=#3a3a3a
highlight CursorColumn     cterm=NONE ctermfg=NONE  ctermbg=234   gui=NONE guifg=NONE    guibg=#3a3a3a
highlight ColorColumn      cterm=NONE ctermfg=NONE  ctermbg=234   gui=NONE guifg=NONE    guibg=#3a3a3a
highlight Cursor           cterm=NONE ctermfg=235   ctermbg=White gui=NONE guifg=#262626 guibg=#ffffff
highlight Visual           cterm=NONE ctermfg=NONE  ctermbg=59    gui=NONE guifg=NONE    guibg=#5f5f5f
highlight ExtraWhitespace  cterm=NONE ctermfg=NONE  ctermbg=9     gui=NONE guifg=NONE    guibg=#ff0000
highlight Todo             cterm=NONE ctermfg=0     ctermbg=11    gui=NONE guifg=Blue    guibg=Yellow

highlight TabLine          cterm=NONE ctermfg=NONE  ctermbg=59    gui=NONE guifg=NONE    guibg=#5f5f5f
highlight TabLineFill      cterm=NONE ctermfg=NONE  ctermbg=59    gui=NONE guifg=NONE    guibg=#5f5f5f
highlight TabLineSel       cterm=NONE ctermfg=NONE  ctermbg=Black gui=NONE guifg=NONE    guibg=#5f5f5f

highlight Pmenu            cterm=NONE ctermfg=White ctermbg=59    gui=NONE guifg=#ffffff guibg=#5f5f5f
highlight PmenuSel         cterm=NONE ctermfg=59    ctermbg=White gui=NONE guifg=#5f5f5f guibg=#ffffff

" Search colors
highlight MatchParen       cterm=bold ctermfg=NONE  ctermbg=186   gui=NONE guifg=NONE    guibg=#d7d787
highlight IncSearch        cterm=bold ctermfg=235   ctermbg=186   gui=NONE guifg=#262626 guibg=#d7d787
highlight Search           cterm=bold ctermfg=235   ctermbg=186   gui=NONE guifg=#262626 guibg=#d7d787

" Split
highlight VertSplit        cterm=NONE ctermfg=241   ctermbg=241   gui=NONE guifg=#626262 guibg=#626262

" vimdiff colors
highlight DiffAdd          cterm=bold ctermfg=Green ctermbg=17    gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffDelete       cterm=NONE ctermfg=Gray	ctermbg=17    gui=NONE guifg=#87ffff guibg=#00005f
highlight DiffChange       cterm=NONE ctermfg=Gray 	ctermbg=17    gui=NONE guifg=#87ffff guibg=#00005f
highlight DiffText         cterm=NONE ctermfg=White	ctermbg=124   gui=NONE guifg=#ffffff guibg=#af0000

