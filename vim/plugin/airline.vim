
"
" nice themes:
"    * ubaryd no replace theme
"    * badwolf no replace theme
"    * hybridline

set laststatus=2 " Always show status line
set noshowmode   " get rid of the second status line

let g:airline_powerline_fonts = 1
let g:airline_theme = 'term'

" airline-tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader><Backspace> <Plug>AirlineSelectPrevTab
nmap <leader><Return> <Plug>AirlineSelectNextTab

" airline-whitespace
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#symbol = '!'
" spaces are allowed after tabs, but not in between
" this algorithm works well with programming styles that use tabs for
" indentation and spaces for alignment
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" Git section
let g:airline#extensions#hunks#enabled = 1

" powerline sections
let g:airline_section_y = ''

" powerline symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 's'
let g:airline_symbols.notexists = '!e'
let g:airline_symbols.whitespace = 'Ξ'
