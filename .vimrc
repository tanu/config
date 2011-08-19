vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
nmap <ESC><ESC> :nohlsearch<CR><ESC> 
" tabを開く
nmap <leader>1 :tabnew<CR><ESC>
nmap <leader>q :tabp<CR><ESC>
nmap <leader>w :tabn<CR><ESC>

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
let g:neocomplcache_enable_quick_match = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-e>  neocomplcache#close_popup()
"
"imap  <expr><TAB> neocomplcache#plugin#snippets_complete#expandable() ? "\(neocomplcache_snippets_expand)" : "\"

"Ctrl+eでスニペット展開
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


" operator-camelize <Leader>はデフォルトで\
nmap <leader>c <Plug>(operator-camelize)<CR><ESC>
nmap <leader>C <Plug>(operator-decamelize)<CR><ESC>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

set ts=4
set sw=4
set showmatch
set number
set title
set expandtab
set autoindent
"set nohlsearch
set hlsearch
set noswapfile

"autocmd FileType php  :set dictionary=~/.vim/php.dict

"set tags=direct/app/tags,testtools/direct_test/lib/tags,./tags,../tags,../../tags
set tags=./tags,tags,~/tags 
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/


"unite.vim関連

" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

