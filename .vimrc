"-------------------------------------------------------
" neobundle
"-------------------------------------------------------
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

NeoBundle 'mattn/emmet-vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'Yggdroot/indentLine'

NeoBundleCheck
call neobundle#end()

"-------------------------------------------------------
"vim基本設定 
"-------------------------------------------------------

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

"ファイルを開きなおしてもundoを利用可能にする
if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
endif

filetype off
filetype plugin indent on

"文字コード設定
set encoding=utf8
set fileencoding=utf-8

"インデント設定
set autoindent
set smartindent

"行数の設定
set number

"スワップファイルを作成しない
set noswapfile

"インデントの追加、削除するときもスペース4文字分にする
set tabstop=4

"タイトルを表示する
set title

"インデントをスペース4文字分に設定
set shiftwidth=4

"自動改行しない
set textwidth=0

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"カーソルの行に線を引く
set cursorline

"文字列検索時に大文字小文字を区別しない
set ignorecase

"コマンド入力を2行分に設定
set cmdheight=2
set laststatus=2

"括弧やダブルクウォート等を強調表示
set showmatch

"文字列検索時に大文字小文字を区別しない
set wrapscan

"-------------------------------------------------------
"インサートモードのキーマッピング
"-------------------------------------------------------
inoremap jj <ESC>
inoremap <C-l> <RIGHT>
inoremap <C-k> <UP>
inoremap <C-j> <DOWN>
inoremap < <><LEFT>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap <<BACKSPACE> <<BACKSPACE>
inoremap (<BACKSPACE> (<BACKSPACE>
inoremap {<BACKSPACE> {<BACKSPACE>
inoremap "<BACKSPACE> "<BACKSPACE>
inoremap '<BACKSPACE> '<BACKSPACE>

"-------------------------------------------------------
" indentLine
"-------------------------------------------------------
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#FDB933'
let g:indentLine_char = '|'

"-------------------------------------------------------
"全角スペースを可視化する
"-------------------------------------------------------
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=grey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

