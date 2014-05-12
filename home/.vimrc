"viと互換しない
set nocompatible

if has('vim_starting') && has('reltime')
    let g:startuptime = reltime()
    augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
        \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
    augroup END
endif

"OS判定
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
    \ && (has('mac') || has('macunix') || has('gui_macvim')
    \ || (!executable('xdg-open') && system('uname') =~? '^darwin'))


" 言語指定
if s:is_windows
    "For Windows.
    language messages ja_JP
elseif s:is_mac
    " For Mac.
    language messages ja_JP.UTF-8
    language ctype ja_JP.UTF-8
    language time ja_JP.UTF-8
else
    " For Linux.
    language messages C
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

filetype plugin on
filetype indent on
syntax on
"filetype off 

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set fileformats=unix,dos,mac
set helplang& helplang=ja,en
"not make file.swp
set noswapfile
set number
set confirm
"ヤンクでクリップボードコピー
set clipboard=unnamed,autoselect
"in swap-file dir
set directory=$HOME/vimbackup

"tab + indent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set showmatch

"serach
set hlsearch
set incsearch
"大文字小文字区別なし
set ignorecase
"大文字の場合は区別
set smartcase

"コマンドラインの高さを2行に
set cmdheight=2
" ファイル補完時のファイル名表示形式
set wildmode=list,full
"スペースキーでカーソルを画面中心に保ってスクロール
"nnoremap <Space> jzz
"nnoremap <S-Space> kzz
"set cursorline

" Unite
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

NeoBundle 'Shougo/vimfiler.vim'

" 補完
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : ''
   \ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"color-scheme
NeoBundle 'w0ng/vim-hybrid'
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
let g:Powerline_symbols = 'fancy'

"status-line
" conf.d/lightline.vim
set laststatus=2
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" load *.vim files
set runtimepath+=~/.vim/
runtime! conf.d/*.vim

"================================================================
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/neosnippet'

"grab some text and send to GNU(tmux)
"NeoBundle 'jpalardy/vim-slime' 
"let g:slime_target = "tmux"
"let g:slime_paste_file = "$HOME/.slime_paste"

NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree.git' "view directory tree
  nmap <silent> <C-e>      :NERDTreeToggle<CR>
  vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
  omap <silent> <C-e>      :NERDTreeToggle<CR>
  imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
  cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2

"hight spec grep
NeoBundle 'rking/ag.vim' 
"yank history manager
"NeoBundle 'vim-scripts/YankRing' 
"multi-words hilight manager
NeoBundle 't9md/vim-quickhl' 

"NeoBundle 'taichouchou2/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
"
" comment out
NeoBundle 'scrooloose/nerdcommenter'
" space behind comment 
let NERDSpaceDelims = 1
" toggle comment command
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
