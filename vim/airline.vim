
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
