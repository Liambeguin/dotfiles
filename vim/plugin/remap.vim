" Misc
" Use enter to create new lines without entering insert mode
nnoremap <CR> o<Esc>
" 'disable' ex-mode
nnoremap Q <Esc>
" Treat long lines as break lines
map j gj
map k gk
" Quick Esc
inoremap jj <Esc>
" resume exploring files
nmap <leader>r :Rexplore<CR>
" go back to previous file after 'gf'
nnoremap gb :e #<CR>


" Git
" Insert at the begining
nnoremap <leader>gi ggI
" empty file: useful when aborting a git rebase -i
nmap <leader>gd ggVGd
