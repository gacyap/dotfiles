"viと互換しない set nocompatible
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
set guifont=Ricty:h15
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

"コマンド/ステータスラインの高さ2行に
set laststatus=2
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
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree.git' "view directory tree
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rking/ag.vim' 
"multi-words hilight manager
NeoBundle 't9md/vim-quickhl' 
NeoBundle 'vim-scripts/taglist.vim'

" unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" nerdtree
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

" nerdcommenter  //comment out
NeoBundle 'scrooloose/nerdcommenter'
" space behind comment 
let NERDSpaceDelims = 1
" toggle comment command
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

"color-scheme
NeoBundle 'w0ng/vim-hybrid'
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
let g:Powerline_symbols = 'fancy'

" taglist
set tags=.tags
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

" load *.vim files
set runtimepath+=~/.vim/
runtime! conf.d/*.vim

"================================================================
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/neosnippet'

"grab some text and send to GNU(tmux)
"NeoBundle 'jpalardy/vim-slime' 
"let g:slime_target = "tmux"
"let g:slime_paste_file = "$HOME/.slime_paste"

"yank history manager
"NeoBundle 'vim-scripts/YankRing' 
