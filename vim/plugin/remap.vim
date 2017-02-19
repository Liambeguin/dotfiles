
" Use enter to create new lines without entering insert mode
nnoremap <CR> o<Esc>

" Treat long lines as break lines
map j gj
map k gk

" Quick Esc
inoremap jj <Esc>

" Insert at the begining
nnoremap <leader>i ggI

nnoremap Q <Esc>

nmap <leader>d :d#<bar>bd#<CR>


" empty file: useful when aborting a git rebase -i
nmap <leader>A ggVGd

" resume exploring files
nmap <leader>r :Rexplore<CR>
