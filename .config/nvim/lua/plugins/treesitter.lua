-- treesitter: 言語非依存の汎用 parser のみを指定。
-- 言語固有の parser（go, terraform, typescript, yaml...）は各 lang extra が
-- 自動で ensure_installed に追加するので、ここには書かない。
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 既存リストを壊さず追記する（= に代入すると extra の指定を上書きしてしまう）
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "lua",
        "vim",
        "regex",
        "query",
        "markdown_inline",
      })
    end,
  },
}
