syntax on
set t_Co=256

set autoindent
set smartindent
set expandtab
set encoding=utf-8
set fileencodings=utf-8
set cursorline
set number
set showmode
set showmatch
set title
set backspace=indent,eol,start
set inccommand=split
set imdisable
set hidden
set nobackup
set nowritebackup
set conceallevel=0
set clipboard+=unnamedplus
" htmlのマッチするタグに%でジャンプ
source $VIMRUNTIME/macros/matchit.vim

" 行番号を表示
set number
" UTF-8でエンコーディング
set encoding=utf-8
" シンタクッスハイライト
syntax enable
syntax on
" titleを表示
set title
" vimの短形選択で文字がなくても右へすすめる
set virtualedit=block
" wildmenuオプションを有効
set wildmenu
" インデント幅
set shiftwidth=4
" タブキーの挿入文字数を指定
set softtabstop=4
set tabstop=4

set list
set listchars=tab:>-,extends:<,trail:-

" カッコを補完する
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
" "や'を補完する
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

hi Comment ctermfg=gray

if has('mouse')
  set mouse=a
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/neosnippet-snippets/neosnippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Plugin NerdTree key-mapping
map <C-n> :NERDTreeToggle<CR>

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

" Golang Auto import
let g:go_fmt_command = "goimports"

" rustfmt auto
let g:rustfmt_autosave = 1

" Ctrl+sで保存できるようにする。
noremap <c-s> :w<cr>
" Ctrl+qで保存/閉じることができるようにする。
noremap <c-q> :q<cr>
" Ctrl+aで次tab移動
nmap <c-a> :tabn<cr> 

" buffer connection
nnoremap <c-j> :bprev<cr>
nnoremap <c-k> :b<cr>

hi Comment ctermfg=gray

" windows用clipboard
let g:clipboard = {
            \   'name': 'myClipboard',
            \   'copy': {
            \       '+': 'win32yank.exe -i',
            \       '*': 'win32yank.exe -i',
            \   },
            \   'paste': {
            \       '+': 'win32yank.exe -o',
            \       '*': 'win32yank.exe -o',
            \   },
            \   'cache_enabled': 1,
            \}


set termguicolors
colorscheme jellybeans
let g:timestamp_save_path = "/mnt/c/Users/s.tanaka/work/memo"

au FileType go set tabstop=2 softtabstop=2 shiftwidth=2
