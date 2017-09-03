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
nmap - :Rexplore<CR>
" go back to previous file after 'gf'
nnoremap gb :e #<CR>

nnoremap q: :q<CR>

nnoremap <leader>l :set list!<CR>

" Git
" Insert at the begining
nnoremap <leader>gp :%s/^pick/p/g<CR>
" Insert at the begining
nnoremap <leader>gi ggI
" insert signoff line
nnoremap <leader>gs :call GitSign("Signed-off-by: ")<CR>
" empty file: useful when aborting a git rebase -i
nmap <leader>gd ggVGd


function! GitSign(text)
	let b:user  = system('git config user.name')
	let b:email = " <" . system('git config user.email') . ">"
	let b:sign = substitute(a:text.b:user.b:email, "[^[:print:]]", "", "g")
	let s:test = search(b:sign, "")

	if !s:test
		call append(".", b:sign)
	else
		echo "Already added Signed!"
	endif
endfunction
