-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--- 基本的な設定
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.o.cursorline = true
vim.o.number = true
vim.o.showmode = true
vim.o.showmatch = true
vim.o.title = true
vim.o.backspace = "indent,eol,start"
vim.o.inccommand = "split"
vim.o.imdisable = true
vim.o.hidden = true
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.conceallevel = 0
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true

-- その他の設定
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.virtualedit = "block"
vim.o.wildmenu = true

-- シンタクスハイライト
vim.cmd("syntax enable")

-- リスト文字とリスト表示の設定
vim.o.list = true
vim.o.listchars = "tab:>-,extends:<,trail:-"

-- 引用符を補完するためのキーマッピング
vim.api.nvim_set_keymap("i", '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap("i", "'", "''<Left>", { noremap = true })
