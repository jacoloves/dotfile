-- カラースキーム: gruvbox
return {
  -- プラグイン本体
  { "ellisonleao/gruvbox.nvim" },

  -- LazyVim にデフォルトカラースキームとして gruvbox を使うよう指定
  -- （init.lua の vim.cmd("colorscheme gruvbox") と二重だが、LazyVim 流の
  --   指定はこちらに集約しておく）
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox" },
  },
}
