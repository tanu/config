vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
nmap <ESC><ESC> :nohlsearch<CR><ESC> 
" tabを開く
nmap <leader>n :tabnew<CR><ESC>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
set complete=.,w,b,u,t,k
"let g:NeoComplCache_SnippetsDir = '.vim/autoload/neocomplcache/sources/snippets_complete/'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'pl' : $HOME . '/.vim/dict/perl.dict'
\ }
let g:neocomplcache_max_list = 100
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-e>  neocomplcache#close_popup()
"
"imap  <expr><TAB> neocomplcache#plugin#snippets_complete#expandable() ? "\(neocomplcache_snippets_expand)" : "\"

"Ctrl+eでスニペット展開
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)



" operator-camelize <Leader>はデフォルトで\
nmap <leader>c <Plug>(operator-camelize)
nmap <leader>C <Plug>(operator-decamelize)


set ts=4
set sw=4
set showmatch
set number
set title
set expandtab
set autoindent
"set nohlsearch
set hlsearch

"autocmd FileType php  :set dictionary=~/.vim/php.dict
