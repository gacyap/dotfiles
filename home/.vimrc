" NeoBundleInstall!
set nocompatible
filetype off 

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

filetype plugin on
filetype indent on
syntax enable
filetype on

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
"not make file.swp
set noswapfile
"avairable clipbord
" set clipboard=unnamed,autoselect
set clipboard+=unnamed
set number
set confirm
"helpを日本語優先
set helplang=ja

" color scheme
NeoBundle 'w0ng/vim-hybrid'
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
if !has('gui_running')
    set t_Co=256
endif

"------- tab conf ------
"tabspace -> brank
set expandtab
"auto indent width
set shiftwidth=4
set tabstop=4
set softtabstop=4
"go on before indent when start newline
set autoindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
"-------- /tab ---------

"コマンドラインの高さを2行に
set cmdheight=2
"use case insensitive search, except when using capital letters
set ignorecase
"高度な自動インデント
set smartcase
set wildmenu
"検索ハイライト
set hlsearch
"スペースキーでカーソルを画面中心に保ってスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz
set cursorline
"ビジュアルモード時vで行末まで選択
vnoremap v $h

"augroup BufferAu
"  autocmd!
  " カレントディレクトリを自動的に移動
"  autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" |cd %:p:h | endif
"augroup END

""CakePHPの.ctpファイルでシンタックス
autocmd BufNewFile,BufRead *.ctp set filetype=php
"Quick Escaping
"inoremapc>
"repeat same paste
vnoremap <silent> <C-p> "0p<CR>

"----------------------------------
"set neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"----------------------------------
"set neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

NeoBundle 'jpalardy/vim-slime' "grab some text and send to GNU(tmux)
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
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

" Align : 高機能整形・桁揃えプラグイン
NeoBundle 'Align'
" フィルタリングと整形
NeoBundle 'godlygeek/tabular'
" マルチバイト対応の整形
NeoBundle 'h1mesuke/vim-alignta'
" YankRing.vim :ヤンクの履歴を管理し、順々に参照、出力できるようにする
NeoBundle 'YankRing.vim'

NeoBundle 'rking/ag.vim'
" multi-words hilight manager
NeoBundle 't9md/vim-quickhl'

"comment out
NeoBundle 'scrooloose/nerdcommenter'
" space behind comment 
let NERDSpaceDelims = 1
" toggle comment command
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

NeoBundle 'vim-scripts/buftabs'
noremap <C-p> :bp<CR>
noremap <C-n> :bn<CR>
" バッファタブにパスを省略してファイル名のみ表示する
let g:buftabs_only_basename=1
" バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1
" 現在のバッファをハイライト
let g:buftabs_active_highlight_group="Visual"
 
" statusline
set laststatus=2
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
"----------------------------------
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'
" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
"----------- end ------------------
