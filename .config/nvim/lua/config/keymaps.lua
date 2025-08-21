-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<Return><Return>", "<c-w><c-w>", { noremap = true, silent = true })
-- 1つ後のバッファを切り替えるキーバインドを<C-b>に変更
vim.api.nvim_set_keymap("n", "<C-j>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":bprev<CR>", { noremap = true, silent = true })
-- `neo-tree` の起動キーマッピングを設定
vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n><C-d>", ":Neotree<Space>close<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":Neotree<Space>git_status<CR>", { noremap = true, silent = true })
