-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<Return><Return>", "<c-w><c-w>", { noremap = true, silent = true })
-- 1つ後のバッファを切り替えるキーバインドを<C-b>に変更
vim.api.nvim_set_keymap("n", "<C-j>", ":bnext<CR>", { noremap = true, silent = true })
-- `neo-tree` の起動キーマッピングを設定
vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n><C-d>", ":Neotree<Space>close<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":Neotree<Space>git_status<CR>", { noremap = true, silent = true })

-- Copilotのデフォルトのキーマップを無効化
vim.g.copilot_no_tab_map = true

-- エンターキーで改行のみを行う
vim.api.nvim_set_keymap("i", "<CR>", "<CR>", { noremap = true, silent = true })

-- タブキーでCopilotの補完を受け入れる条件を再設定
vim.api.nvim_set_keymap(
  "i",
  "<Tab>",
  'pumvisible() ? "\\<C-n>" : (copilot#Accept("<Tab>") ? "" : "\\<Tab>")',
  { expr = true, noremap = true, silent = true }
)
