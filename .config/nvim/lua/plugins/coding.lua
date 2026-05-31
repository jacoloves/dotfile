-- 言語非依存の補完(cmp)・スニペット設定
return {
  -- ▼ LuaSnip: デフォルトの <Tab>/<S-Tab> を無効化（supertab を自前定義するため）
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- ▼ nvim-cmp: cmp-emoji 追加 + supertab(<Tab>で次候補/スニペット展開)
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      -- emoji を補完ソースに追加
      table.insert(opts.sources, { name = "emoji" })

      -- カーソル前に単語があるか判定（supertab の挙動分岐に使う）
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- 補完表示中なら次候補へ
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump() -- スニペット展開/次プレースホルダへ
          elseif has_words_before() then
            cmp.complete() -- 単語入力中なら補完を起動
          else
            fallback() -- それ以外は通常の Tab
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- 前候補へ
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1) -- スニペットの前プレースホルダへ
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- ▼ mason: 汎用ツールのみ導入（tflint/flake8 は各 lang extra/ruff に任せて除外）
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- Lua フォーマッタ
        "shellcheck", -- シェル静的解析
        "shfmt", -- シェルフォーマッタ
      },
    },
  },
}
