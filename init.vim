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
set relativenumber
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


"Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/home/shooonng/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/home/shooonng/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Plugin NerdTree key-mapping
map <C-n> :NERDTreeToggle<CR>

" Golang Auto import
let g:go_fmt_command = "goimports"

" rustfmt auto
let g:rustfmt_autosave = 1

" Ctrl+sで保存できるようにする。
nnoremap <c-s> :w<cr>
" Ctrl+qで保存/閉じることができるようにする。
nnoremap <s-q> :q<cr>
" Ctrl+aで次tab移動
nmap <c-a> :tabn<cr>
" Enterを2回押すことでペインを移動する
nnoremap <Return><Return> <c-w><c-w>

" buffer connection
nnoremap <c-j> :bprev<cr>
nnoremap <c-k> :b<cr>

hi Comment ctermfg=gray
set termguicolors
" colorscheme jellybeans
colorscheme dracula

" vim-javascript setting
let g:javascript_plugin_flow = 1

" rustfmt autosave
let g:rustfmt_autosave = 1

au Filetype typescript,javascript setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
au Filetype typescriptreact setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
au Filetype php setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
au Filetype *.go  setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
let g:copilot_filetyps = {'yaml': v:true}
