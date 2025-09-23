-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme nightfox")
vim.g.lazyvim_check_order = false
vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight NormalNC guibg=NONE")
