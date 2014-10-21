" This function allows to use Tab to auto complete
" in insert mode
function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" changing autocomplete in command mode
" so it displays options
set wildmode=longest,list

" TODO add whiteSpace hilight
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
