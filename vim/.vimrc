"--------------------------------------------------------------
"          shell                                            <<<
"--------------------------------------------------------------
set shell=/bin/zsh
" <<<

"--------------------------------------------------------------
"          source local settings                            <<<
"--------------------------------------------------------------
if filereadable(expand('~/dotfiles/local/local.vim'))
  source ~/dotfiles/local/local.vim
endif
" <<<

"--------------------------------------------------------------
"          encoding & color                                 <<<
"--------------------------------------------------------------
"language en_US.UTF-8
set encoding=utf-8
scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac
set ambiwidth=double
set t_Co=256
" <<<

"--------------------------------------------------------------
"          Vim Options                                      <<<
"--------------------------------------------------------------
" <Leader>キー
let mapleader = " "

" スワップファイルの作成先を変更
set noswapfile

" ヤンクに*レジスタを使う
set clipboard=unnamed

" ビープ音を消す
set belloff=all

" 行番号系
set number

" タイトル
set title

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索した時にハイライト
set hlsearch

" auto read
set autoread

" マウスを有効化
set mouse=a

" 折り畳みしない
set foldlevel=50
" <<<

"--------------------------------------------------------------
"          indent, space, tab                               <<<
"--------------------------------------------------------------
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
au FileType go setlocal sw=4 ts=4 sts=4 noet
set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=red gui=reverse guifg=red
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" <<<

"--------------------------------------------------------------
"          key mapping                                      <<<
"--------------------------------------------------------------
vnoremap x "_x
nnoremap x "_x
nnoremap bd :bd<CR>

" 括弧の補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap ` ``<LEFT>
inoremap < <><LEFT>

" 関数括弧の補完
inoremap {<CR> {}<Left><CR><ESC><S-o>
inoremap [<CR> []<Left><CR><ESC><S-o>
inoremap (<CR> ()<Left><CR><ESC><S-o>

" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" insertモードでemacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" visualモードで選択してからのインデント調整で調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" 画面分割系
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

" terminal mode
" USAGE) <C-y>: change mode to job-mode, i: back to teminal-normal-mode
tmap <C-y> <c-\><c-n>
" <<<

"--------------------------------------------------------------
"          plugin manager                                   <<<
"--------------------------------------------------------------
if &compatible
  set nocompatible
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundles')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir = expand('~/dein/')

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " load plugins instantly
  let s:instantlyFiles = glob(s:toml_dir . 'instantly-load/*.toml')
  for s:file in split(s:instantlyFiles, "\n")
    call dein#load_toml(s:file)
  endfor

  " load plugins lazy
  let s:lazyFiles = glob(s:toml_dir . 'lazy-load/*.toml')
  for s:file in split(s:lazyFiles, "\n")
    call dein#load_toml(s:file, { 'lazy': 1 })
  endfor

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" <<<

"--------------------------------------------------------------
"          colorscheme                                      <<<
"--------------------------------------------------------------
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
filetype plugin indent on
" <<<
