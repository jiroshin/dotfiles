set fenc=utf-8
set encoding=utf-8
scriptencoding utf8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" 意図しない挙動を防ぐ 
filetype off
filetype plugin indent off

" スワップファイルの作成先を変更
" set directory=~/.vim/swaps
set noswapfile

" ヤンクをクリップボードへ繋ぐ
set clipboard+=unnamed

" ビープ音を消す
set belloff=all

" 行番号系
set number
highlight LineNr ctermfg=240

" tagsファイルの場所.基本的に$HOME配下のtagsディレクトリを参照
set tags=./tags,tags,~/tags

" タイトル系
set title

" インデント幅
set shiftwidth=2
set tabstop=2

"勝手にインデント系
set autoindent
set smartindent

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索した時にハイライト
set hlsearch

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 行が長くなった時に折り返しをしない
" set nowrap

" マウス操作を可能にする
" set mouse=a


" キーのオリジナル再割り当て--------------------------------------------
vnoremap x "_x
nnoremap x "_x
nnoremap 1 ^
nnoremap 2 $
vnoremap ? :'<,'>TComment<CR>
nnoremap <silent> , :bprev<CR>
nnoremap <silent> . :bnext<CR>
nnoremap \ :%s/hoge/hoge2/g<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap bd :bd<CR>

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" insertモードでemacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

"tagsジャンプ時に候補が複数ある時は一覧表示
noremap <C-]> g<C-]> 

" visulaモードで選択してからのインデント調整で調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" Ripgrep
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<Space>

" FZF
nnoremap <C-p> :GFiles<CR>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

"コントロールaでファイルツリーを表示する
nnoremap <silent><C-a> :NERDTreeFind<CR>:vertical res 30<CR>

"dein.vimでプラグイン管理------------------------------------------------
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim


if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')


  " ここにどんどんプラグインを追加する。追加したら :call dein#install() でインストール
		" ファイルツリーの表示
		call dein#add('scrooloose/nerdtree')
		" ウィンドウの幅をctr+eで調整
		call dein#add('simeji/winresizer')
		" インデントに色付け
		call dein#add('nathanaelkane/vim-indent-guides')
		" ctr+-でコメントアウトする
		call dein#add('tomtom/tcomment_vim')
		" ステータスバーを見やすくする
		call dein#add('vim-airline/vim-airline')
		call dein#add('vim-airline/vim-airline-themes')
		" vimでgitを操作する
		" call dein#add('tpope/vim-fugitive')
		" gitのHEADとの差分を表示する
		call dein#add('airblade/vim-gitgutter')
		" Ruby向けにendを自動挿入してくれる
		call dein#add('tpope/vim-endwise')
		" slimのハイライト
		call dein#add('slim-template/vim-slim')
		" fzf
		call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
		call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
		" Reactハイライト
		call dein#add('pangloss/vim-javascript')
		call dein#add('maxmellon/vim-jsx-pretty')
		" 括弧のレインボーハイライト
		call dein#add('luochen1990/rainbow')

  call dein#end()
  call dein#save_state()
endif
"ここまでがdein.vim----------------------------------------------------

" ここからはステータスバーの見栄えを良くするフォントを設定-------------

" ステータスバーとタブの設定
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'term'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" バッファタグの表示
let g:airline#extensions#tabline#enabled = 1
" バッファタブに番号を表示する
let g:airline#extensions#tabline#buffer_idx_mode = 1
" バッファのファイル名にパスを含めない
let g:airline#extensions#tabline#fnamemod = ':t'

" レインボー括弧の設定
let g:rainbow_active = 1

" NERDTress の設定 ------------------------------------------------
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" -------------------------------------------------------------------

" gitのHEADとの差分を表示するプラグインの設定
set signcolumn=yes
let g:gitgutter_async = 1
let g:gitgutter_sign_modified = 'rw'
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" インデントを見やすくするプラグインをonにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=239

:set modifiable
:set write

" ファイルタイプ関連を有効にする
filetype plugin indent on
syntax enable
