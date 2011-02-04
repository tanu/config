vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
nmap <ESC><ESC> :nohlsearch<CR><ESC> 
" tabを開く
nmap <leader>n :tabnew<CR><ESC>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" operator-camelize <Leader>はデフォルトで\
map <leader>c <plug>(operator-camelize)
map <leader>C <plug>(operator-decamelize)


set ts=4
set sw=4
set showmatch
set number
set title
set expandtab
set autoindent
"set nohlsearch
set hlsearch
