-- 言語非依存のエディタ系プラグイン設定
return {
  -- ▼ telescope: ファイル/シンボル検索の見た目と挙動を調整
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- <leader>fp でプラグイン本体のファイル群を検索
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal", -- 横分割レイアウト
        layout_config = { prompt_position = "top" }, -- 入力欄を上部に
        sorting_strategy = "ascending", -- 候補を上から並べる
        winblend = 0, -- 透過なし
      },
    },
  },

  -- ▼ telescope-fzf-native: ネイティブfzfで検索を高速化
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make", -- C拡張をビルド
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- ▼ symbols-outline: <leader>cs で関数/変数のアウトライン表示
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- ▼ lualine: ステータスラインの lualine_x に 😄 を追加
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- ▼ trouble: 現状の example.lua は enabled=false で無効化していたため踏襲する。
  --   診断一覧(<leader>xx等)を使いたくなったら下の spec を丸ごと削除すれば復活する。
  { "folke/trouble.nvim", enabled = false },
}
