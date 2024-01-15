if &compatible
    set nocompatible
endif

let s:config_dir = expand($XDG_CONFIG_HOME . '/nvim')
let s:cache_dir = expand($XDG_CACHE_HOME . '/nvim')

let s:plug_dir = s:cache_dir . '/plugged'
let s:autoload_dir = expand($XDG_DATA_HOME . '/nvim/site/autoload/plug.vim')

if !filewritable(s:autoload_dir)
    silent execute '!curl -fLo ' . $s:autoload_dir . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

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

call plug#begin(s:plug_dir)
Plug 'tpope/vim-surround'
Plug 'dracula/vim'
Plug 'sheerun/vim-polyglot'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'github/copilot.vim'
Plug 'tyru/open-browser.vim'
Plug 'previm/previm'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'mattn/vim-lsp-icons'
call plug#end()


" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Plugin NerdTree key-mapping
map <C-n> :NERDTreeToggle<CR>

" Golang Auto import
" let g:go_fmt_command = "goimports"

" goimports
let g:goimports = 1
let g:goimports_simplify = 1

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
au Filetype go  setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
au Filetype hs setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

let g:copilot_filetyps = {'yaml': v:true}
