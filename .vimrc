" シンタックスハイライトON
syntax enable
syntax on
" 行番号を表示
set number
" 自動インデント
set autoindent
" 末尾に合わせてインデントを増減
set smartindent
set expandtab
set encoding=utf-8
set fileencodings=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4

"set cursorline
set number
set showmode
set showmatch
set title
set backspace=indent,eol,start
set imdisable
set hidden
set nobackup
set nowritebackup
set conceallevel=0
set clipboard=unnamedplus
set relativenumber

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

if has('vim_starting')
 " 挿入モード時に非点滅の縦棒タイプのカーソル
 let &t_SI .= "\e[6 q"
 " ノーマルモード時に非点滅のブロックタイプのカーソル
 let &t_EI .= "\e[2 q"
 " 置換モード時に非点滅の下線タイプのカーソル
 let &t_SR .= "\e[4 q"
endif

if has('clipboard')
    set clipboard=unnamed
endif

""""""""" vundle vim """""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" https://github.com/preservim/nerdtree
" Plugin 'preservim/nerdtree'
" https://github.com/junegunn/fzf.vim
Plugin 'junegunn/fzf'
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
" https://github.com/mattn/vim-lsp-settings
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/vim-lsp-icons'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'
" https://github.com/fatih/vim-go
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'cocopon/iceberg.vim'
Plugin 'jacoloves/timestampMemo.vim'
Plugin 'LeafCage/vimhelpgenerator'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'pangloss/vim-javascript'
" vim-Prisma
Plugin 'pantharshit00/vim-prisma'
" vim-Rust
Plugin 'rust-lang/rust.vim'
" phpactor
Plugin 'phpactor/phpactor'
" vim-clang-format
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
" dracula vim
Plugin 'dracula/vim',{'name':'dracula'}
" vim-devicons
Plugin 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
nnoremap <C-n> :NERDTreeToggle<CR>

set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set background=dark
" colorschema
colorscheme dracula
" cd C:\Users\s.tanaka\tana\lab 
" timestampmemoの保存先
let g:timestamp_save_path = "C:\\Users\\s.tanaka\\work\\memo"


" Ctrl+sで保存できるようにする。
noremap <c-s> :w<cr>
" Ctrl+qで保存/閉じることができるようにする。
noremap <c-x> :q<cr>
" Ctrl+aで次tab移動
nmap <c-a> :tabn<cr> 

" buffer connection
nnoremap <c-j> :bprev<cr>
nnoremap <c-k> :b<cr>

" gvim terminal mode key mapping
if has("gui_running")
    nnoremap <c-t> :tab terminal<cr>
    tnoremap <c-v> <c-w>"*
    tnoremap <c-a> <c-w>:tabn<cr>
endif


" Golang Auto import
let g:go_fmt_command = "goimports"

" changelog save path
let g:changelog_save_path = "~/tmp/test_dir/changelog"
" changelog user name
let g:user_full_name = "Shotaro Tanaka"
" changelog user mail address
let g:user_mail_address = "5511068t@gmail.com"

" typescript
if executable('typescript-language-server')
    augroup LspTypeScript
        au!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
            \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
            \ 'whitelist': ['typescript', 'typescript.tsx', 'javascript', 'javascript.jsx'],
            \ })
        autocmd FileType typescript setlocal omnifunc=lsp#complete
    augroup END :echomsg "vim-lsp with `typescript-language-server' enabled"
else
    :echomsg "vim-lsp for typescript unavailable"
endif

" vim-javascript setting
let g:javascript_plugin_flow = 1

" clangd
if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '-background-index']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

" rustfmt autosave
let g:rustfmt_autosave = 1

au FileType go  set tabstop=2 softtabstop=2 shiftwidth=2
au FileType js  set tabstop=2 softtabstop=2 shiftwidth=2
au FileType ts  set tabstop=2 softtabstop=2 shiftwidth=2
au FileType tsx set tabstop=2 softtabstop=2 shiftwidth=2
au FileType php set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" clang-format auto
autocmd FileType c,cc,cpp,h ClangFormatAutoEnable

" clang-format setting detail
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

" golang language server settings
function! s:on_lsp_buffer_enabled() abort
    if &buftype ==# 'nofile' || &filetype =~# '^\(quickrun\)' || getcmdwintype() ==# ':'
        return
    endif
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> <c-k> <plug>(lsp-hover)
endfunction

augroup vimrc_lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
