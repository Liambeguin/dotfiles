
"
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim


set background=light

highlight clear

highlight Normal                                             gui=NONE guifg=#ffffff guibg=#000000
highlight CursorLine  cterm=NONE ctermfg=NONE  ctermbg=234   gui=NONE guifg=NONE    guibg=#3a3a3a
highlight ColorColumn cterm=NONE ctermfg=NONE  ctermbg=234   gui=NONE guifg=NONE    guibg=#3a3a3a
highlight Cursor      cterm=NONE ctermfg=235   ctermbg=White gui=NONE guifg=#262626 guibg=#ffffff
highlight Visual      cterm=NONE ctermfg=NONE  ctermbg=59    gui=NONE guifg=NONE    guibg=#5f5f5f

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


