-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme gruvbox")
vim.g.lazyvim_check_order = false
vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight NormalNC guibg=NONE")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
